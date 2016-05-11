class RelationsController < ApplicationController
  # 類義語検索	
  def synonym
  	srch = Relation.where("rel_id = ? and syn_ant_cd = 1", params[:id]).pluck(:word_id)
  	@words = Word.where("id in (?)", srch)
  	render '/lessons/home'
  end

  # 対義語検索
  def antonym
  	srch = Relation.where("rel_id = ? and syn_ant_cd = 2 and ant_contrast_cd = ?", params[:id], params[:format])\
  	.pluck(:word_id)
  	@words = Word.where("id in (?)", srch)
  	render '/lessons/home'
  end
end
