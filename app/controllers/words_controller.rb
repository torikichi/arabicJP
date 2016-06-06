class WordsController < ApplicationController
  include Common

  def index
    @words = Word.find_by_sql([generate_query("word") + "where w.word=? group by w.id", params[:srchWrd]])
    @words = Kaminari.paginate_array(@words).page(params[:page])
  	render '/lessons/home'
  end

  # 語根検索
  def wordsRoots
    @words = Word.find_by_sql([generate_query("word") + "where w.root=? group by w.id", params[:id]])
    @words = Kaminari.paginate_array(@words).page(params[:page])
    render '/lessons/home'
  end

  # Lessonに紐付く単語を取得
  def lesson_in_words
    @choisedLesson = Lesson.find(params[:id])

    @words = Word.eager_load(:appearances, :examples).where("appr_id=?", params[:id]).page(params[:page])
  end

end
