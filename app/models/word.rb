class Word < ActiveRecord::Base
	has_many :appearances, foreign_key: [:word_id], dependent: :delete_all
	has_many :lessons, through: :appearance
	has_many :examples, foreign_key: [:word_id], dependent: :delete_all
	has_many :relations, foreign_key: [:word_id], dependent: :delete_all
	has_many :synonym, through: :relations, source: :from_word

# 類義語(区分1)および対義語(区分2)の件数を取得する ※件数導出はviewで行うこと
  def cntSynm(kbn, wordId)
	if kbn == 1
	  Relation.find_by_sql(["select rel_id, count(rel_id) as subTotal from relations where syn_ant_cd=? and rel_id in (select rel_id from relations where syn_ant_cd=? and word_id=?) group by rel_id", kbn, kbn, wordId])
	elsif kbn == 2
	  Relation.find_by_sql([\
	  	"select * from relations where syn_ant_cd=? and rel_id=(select rel_id from relations where syn_ant_cd=? and word_id=?) and ant_contrast_cd<>(select ant_contrast_cd from relations where syn_ant_cd=? and word_id=?)"\
	  	, kbn ,kbn, wordId, kbn, wordId])
	end

  end

end
