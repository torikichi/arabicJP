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

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.plural_cd != 0
      # 実装検討中
    else
      @word.plural_cd = nil
    end

    if @word.save
      flash[:success] = "単語登録が完了しました！正しく登録されたか、確認してください。"
      redirect_to @word
    else
      render 'new'
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "更新が正しく完了しました。"
      redirect_to @word
    else
      render 'edit'
    end
  end

  private
    def word_params
      params.require(:word).permit(:word, :word_with_pron, :pos, :meaning, :root)
    end

end
