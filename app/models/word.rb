class Word < ActiveRecord::Base
	has_many :appearances, foreign_key: [:word_id], dependent: :delete_all
	has_many :lessons, through: :appearance
	has_many :examples, foreign_key: [:word_id], dependent: :delete_all
	has_many :relations, foreign_key: [:word_id], dependent: :delete_all
	has_many :synonym, through: :relations, source: :from_word

# 類義語(区分1)の件数、および対義語(区分2)の情報を取得する
  def cntSynm(kbn, wordId)
	if kbn == 1
	  Relation.find_by_sql([\
	  	"select P.rel_id, count(P.rel_id) as subTotal \
	  	from relations P where syn_ant_cd=? and \
	  	exists (select * from relations C where C.rel_id=P.rel_id and syn_ant_cd=? and word_id=?) \
	  	group by rel_id", kbn, kbn, wordId])
	  # heroku(postgresql対策)
	  # P.syn_and_cdを取得カラムから外す
	elsif kbn == 2
	  Relation.where("word_id=? and syn_ant_cd=?", wordId, kbn)

	  # exists句使用版
	  # "select P.*, count(P.rel_id) as aTotal \
	  # from relations P where syn_ant_cd=? and \
	  # exists (select * from relations C where C.rel_id=P.rel_id and syn_ant_cd=? and word_id=?) \
	  # and ant_contrast_cd<>(select ant_contrast_cd from relations where syn_ant_cd=? and word_id=?)\
	  # group by rel_id" , kbn ,kbn, wordId, kbn, wordId])

	  # 件数取得版
	  # Relation.find_by_sql([\
	  # 	"select *, count(rel_id) as aTotal from relations \
	  # 	where syn_ant_cd=? and rel_id in (select rel_id from relations where syn_ant_cd=? and word_id=?) \
	  # 	and ant_contrast_cd<>(select ant_contrast_cd from relations where syn_ant_cd=? and word_id=?) \
	  # 	group by rel_id" , kbn ,kbn, wordId, kbn, wordId])
	end

  end

  # def arrayAppr(wordId)
  # 	Appearance.where("word_id=?", wordId).pluck(:appr_id)
  	
  # end
end
