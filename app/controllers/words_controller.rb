class WordsController < ApplicationController
  def index
  	# @words = Word.find_by(word: params[:srchWrd])
  	@words = Word.where("word = ?", params[:srchWrd])
  	# redirect_to root_path
  	render '/lessons/home'
  end
end
