class Word < ActiveRecord::Base
	has_many :appearances, foreign_key: [:word_id], dependent: :delete_all
	has_many :lessons, through: :appearance
	has_many :examples, foreign_key: [:word_id], dependent: :delete_all
	has_many :relations, foreign_key: [:word_id], dependent: :delete_all
	has_many :synonym, through: :relations, source: :from_word
	has_paper_trail

	VALID_ARABIC_REGEX = /[\u0600-\u06FF]+\s*[\u0600-\u06FF]+/
	validates :word, presence: true, format: { with: VALID_ARABIC_REGEX }
	validates :word_with_pron, presence: true, format: { with: VALID_ARABIC_REGEX }
	validates :meaning, presence: true
	validates :root, length: { in: 2..4 }, format: { with: VALID_ARABIC_REGEX }, allow_blank: true

# 類義語(区分1)の件数、および対義語(区分2)の情報を取得する
  def cntSynm(kbn, wordId)
	if kbn == 1
	  Relation.find_by_sql([\
	  	"select P.rel_id, count(P.rel_id) as subtotal \
	  	from relations P where syn_ant_cd=? and \
	  	exists (select * from relations C where C.rel_id=P.rel_id and syn_ant_cd=? and word_id=?) \
	  	group by rel_id", kbn, kbn, wordId])
	  # heroku(postgresql対策)
	  # P.syn_and_cdを取得カラムから外す
	elsif kbn == 2
	  Relation.where("word_id=? and syn_ant_cd=?", wordId, kbn)
	end
  end

end
