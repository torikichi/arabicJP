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

  # Lessonに紐付く単語を取得
  def lesson_in_words
    srchKeys = params[:id].split('/').map(&:to_i)
    apprArray = Appearance.where("appr_id in (?)", srchKeys).pluck(:word_id)
    @words = Word.where("id in (?)", apprArray)
  end

end
