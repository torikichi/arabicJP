class WordsController < ApplicationController
  include Common

  def index
    # 日本語検索(あいまい検索)対応
    srchCondition = "where w.word=? "
    srchValue = params[:srchWrd]

    if srchValue.empty?
      flash.now[:danger] = 'アラビア語もしくは日本語を入力してください'
      render '/lessons/home'
      return
    end

    if params[:srch_in_jpn]
      srchCondition = "where w.meaning like ? "
      srchValue = "%" + params[:srchWrd] + "%"
    end

    @words = Word.find_by_sql([generate_query("word") + srchCondition + "group by w.id", srchValue])
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
