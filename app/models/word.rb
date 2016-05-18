class Word < ActiveRecord::Base
	has_many :appearances, foreign_key: [:word_id], dependent: :delete_all
	has_many :lessons, through: :appearance
	has_many :examples, foreign_key: [:word_id], dependent: :delete_all
	has_many :relations, foreign_key: [:word_id], dependent: :delete_all
	has_many :synonym, through: :relations, source: :from_word

# 類義語(区分1)および対義語(区分2)の件数を取得する ※件数導出はviewで行うこと
  def cntSynm(kbn, wordId)
	if kbn == 1
	  Relation.find_by_sql([\
	  	"select P.rel_id, P.syn_ant_cd, count(P.rel_id) as subTotal \
	  	from relations P where syn_ant_cd=? and \
	  	exists (select * from relations C where C.rel_id=P.rel_id and syn_ant_cd=? and word_id=?) \
	  	group by rel_id", kbn, kbn, wordId])
	elsif kbn == 2
	  # 件数取得版
	  # Relation.find_by_sql([\
	  # 	"select *, count(rel_id) as aTotal from relations \
	  # 	where syn_ant_cd=? and rel_id in (select rel_id from relations where syn_ant_cd=? and word_id=?) \
	  # 	and ant_contrast_cd<>(select ant_contrast_cd from relations where syn_ant_cd=? and word_id=?) \
	  # 	group by rel_id" , kbn ,kbn, wordId, kbn, wordId])

	  # 仮取得ワークRelationオブジェクト
	  Relation.where("word_id=? and syn_ant_cd=?", wordId, kbn)

	  # 返却用配列(Relationオブジェクト+件数)
	  # rtnArray = Array.new
	  # workArray.each do |work|
	  # 	rtnArray.push(work)
	  	# case work.ant_contrast_cd
	  	# when 0
	  	#   srchKey = 1
	  	# when 1
	  	#   srchKey = 0
	  	# end
	  	# cnt = Relation.where("rel_id=? and ant_contrast_cd=?", work.rel_id, srchKey).count
	  	# rtnArray.store("antCnt", cnt)
	  # end
	  # return rtnArray

	  	# exists句使用版
	  	# "select P.*, count(P.rel_id) as aTotal \
	  	# from relations P where syn_ant_cd=? and \
	  	# exists (select * from relations C where C.rel_id=P.rel_id and syn_ant_cd=? and word_id=?) \
	  	# and ant_contrast_cd<>(select ant_contrast_cd from relations where syn_ant_cd=? and word_id=?)\
	  	# group by rel_id" , kbn ,kbn, wordId, kbn, wordId])
	end

  end

  def arrayAppr(wordId)
  	Appearance.where("word_id=?", wordId).pluck(:appr_id)
  	
  end
end
