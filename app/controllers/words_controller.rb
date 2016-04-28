class WordsController < ApplicationController
  def index
  	@words = Word.find_by(word: params[:word])
  end
end
