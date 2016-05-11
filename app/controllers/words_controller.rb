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

end
