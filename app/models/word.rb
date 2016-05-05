class Word < ActiveRecord::Base
	has_many :appearances, foreign_key: [:word_id], dependent: :delete_all
	has_many :lessons, through: :appearance
	has_many :examples, foreign_key: [:word_id], dependent: :delete_all
	has_many :relations, foreign_key: [:word_id], dependent: :delete_all
	has_many :synonym, through: :relations, source: :from_word

# 類義語(区分1)or対義語(区分2)の件数を取得する
  def cntSynm(kbn, wordId)
  	Relation.find_by_sql(["select rel_id from relations where syn_ant_cd=? and rel_id=(select rel_id from relations where word_id=?)", kbn, wordId])
  end

end
