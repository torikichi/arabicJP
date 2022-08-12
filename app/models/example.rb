# frozen_string_literal: true

class Example < ActiveRecord::Base
  belongs_to :word
  has_paper_trail

  before_validation :changed_example
  VALID_ARABIC_REGEX = /[\u0600-\u06FF]+\s*[\u0600-\u06FF]+/
  validates :sentence_ar, format: { with: VALID_ARABIC_REGEX }, allow_blank: true
  validates :ja_or_ar, presence: true

  private

  # どちらか一方は要入力
  def ja_or_ar
    sentence_ja.presence or sentence_ar.presence
  end

  # 内容を変えずに変更しようとした場合はエラーを返す
  def changed_example
    if !sentence_ja_changed? && !sentence_ar_changed?
      errors.add(:base, NO_CHG_ERROR)
    else
      true
    end
  end
end
