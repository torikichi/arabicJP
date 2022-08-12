# frozen_string_literal: true

class Word < ActiveRecord::Base
  has_many :appearances, dependent: :destroy
  has_many :lessons, through: :appearances
  has_many :examples, dependent: :destroy
  has_many :relations, dependent: :destroy

  has_paper_trail

  before_validation :is_changed_word, on: :update
  VALID_ARABIC_REGEX = /[\u0600-\u06FF]+\s*[\u0600-\u06FF]+/
  validates :word, presence: true, format: { with: VALID_ARABIC_REGEX }
  validates :word_with_pron, presence: true, format: { with: VALID_ARABIC_REGEX }
  validates :meaning, presence: true
  validates :root, length: { in: 2..4 }, format: { with: VALID_ARABIC_REGEX }, allow_blank: true

  scope :search_by_ar, ->(srch_word) { where(words: { word: srch_word }) }
  scope :search_by_ja, ->(srch_word) { where("meaning like ?", "%#{srch_word}%") }
  scope :search_by_root, ->(root) { where(words: { root: root }) }
  scope :get_plural, ->(id) { where(words: { plural_word_id: id }) }
  scope :results_set, -> { includes(:relations, :appearances, :examples).order({ word: :asc }) }

  # 類義語ハッシュを取得
  def self.get_synonyms(rel_id, syn_ant_cd)
    wrd_id_array = Relation.where(rel_id: rel_id, syn_ant_cd: syn_ant_cd).pluck(:word_id)
    Word.where(id: wrd_id_array).results_set
  end

  # 対義語ハッシュを取得
  def self.get_antonyms(rel_id, ant_contrast_cd)
    # 対義語を検索するため、対比コードを入れ替える
    case ant_contrast_cd
    when "0"
      code_for_srch = 1
    when "1"
      code_for_srch = 0
    end

    wrd_id_array = Relation.where(rel_id: rel_id, syn_ant_cd: 2, ant_contrast_cd: code_for_srch).pluck(:word_id)
    Word.where(id: wrd_id_array).results_set
  end

  # 単語に紐付く類義語対義語情報および例文を取得
  def self.get_attached_info(words_list)
    words_list.includes(:relations, :examples)
  end

  private

  # 内容を変えずに変更しようとした場合はエラーを返す
  def is_changed_word
    if !word_changed? && !word_with_pron_changed? && !pos_changed? && !meaning_changed? && !root_changed?
      errors.add(:base, NO_CHG_ERROR)
    end
  end
end
