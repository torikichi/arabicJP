class WordsController < ApplicationController
  def index
  	# @words = Word.find_by(word: params[:srchWrd])
  	@words = Word.where("word = ?", params[:srchWrd])
  	# redirect_to root_path
  	render '/lessons/home'
  end

  # 語根検索
  def wordsRoots
    @words = Word.where("root = ?", params[:id])
    render '/lessons/home'
  end

  # def synonym
  # 	@synmCnt = Relation.find_by_sql("select count(rel_id) from relations where syn_ant_cd=1 and rel_id=(select rel_id from relations where word_id=?)", @word.id)
  # 	render '/lessons/home'
  # end
end
