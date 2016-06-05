class WordsController < ApplicationController
  def index
    @words = Word.find_by_sql([gen_word_query + "where w.word=? group by w.id", params[:srchWrd]])
  	render '/lessons/home'
  end

  # 語根検索
  def wordsRoots
    @words = Word.find_by_sql([gen_word_query + "where w.root=? group by w.id", params[:id]])
    render '/lessons/home'
  end

  # Lessonに紐付く単語を取得
  def lesson_in_words
    @choisedLesson = Lesson.find(params[:id])

    @words = Word.eager_load(:appearances, :examples).where("appr_id=?", params[:id])
  end

  private
    def gen_word_query
      "select w.*, count(e.word_id) as example, count(distinct a.appr_id) as lesson from words w left outer join appearances a on w.id=a.word_id left outer join examples e on w.id=e.word_id "
    end
end
