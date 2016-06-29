class RelationsController < ApplicationController
  include Common

  # 類義語検索	
  def synonym
  	# srch = Relation.where("rel_id = ? and syn_ant_cd = 1", params[:id]).pluck(:word_id)
  	# @words = Word.where("id in (?)", srch)
    @words = Word.find_by_sql([generate_query("relation") + "where rel_id=? and syn_ant_cd=1 group by w.id", params[:id]])
    @words = Kaminari.paginate_array(@words).page(params[:page])
  	render '/lessons/home'
  end

  # 対義語検索
  def antonym
    # 対義語を検索するため、対比コードを入れ替える
    srchKey = params[:format]
    if srchKey == "0"
      srchKey = 1
    elsif srchKey == "1"
      srchKey = 0
    end

  	# srch = Relation.where("rel_id = ? and syn_ant_cd = 2 and ant_contrast_cd = ?", params[:id], params[:format])\
  	# .pluck(:word_id)
  	@words = Word.find_by_sql([generate_query("relation") + "where rel_id=? and syn_ant_cd=2 and ant_contrast_cd=? group by w.id", params[:id], srchKey])
    @words = Kaminari.paginate_array(@words).page(params[:page])
  	render '/lessons/home'
  end

  def add_synonym
    # @relations = Relation.eager_load(:words).where("word.word=? and relation.syn_ant_cd=?", params[:srchSyn], 1)
    @relations = Relation.find_by_sql(["select r.*, w.word as word, w.pos as pos, w.meaning as meaning from relations r left outer join words w on r.word_id=w.id where w.word=? and r.syn_ant_cd=?", params[:srchSyn], 1])
    render '/relations/synsub'
  end

  def edit
    @relations = Relation.where("word_id=?", params[:id])
  end

  def synsub
    #render 'relations/synsub'
  end

end
