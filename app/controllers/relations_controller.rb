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

end
