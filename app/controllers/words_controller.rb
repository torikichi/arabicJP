class WordsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]
  
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
    @disp_obj = Lesson.find(params[:id])

    @words = Word.eager_load(:appearances, :examples).where("appr_id=?", params[:id])

    respond_to do |format|
      format.html do
        @words = @words.page(params[:page])
      end
      format.csv do
        send_data render_to_string, filename: "LV#{@disp_obj.lv}_LESSON#{@disp_obj.lesson_no}_#{@disp_obj.lesson_name}.csv", type: :csv
      end
    end

  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    # if @word.plural_cd != 0
    #   # 実装検討中
    # else
    #   @word.plural_cd = nil
    # end

    if @word.save
      flash[:success] = "単語登録が完了しました！正しく登録されたか、確認してください。"
      redirect_to @word
    else
      render 'new'
    end
  end

  def edit
    @word = Word.find(params[:id])
    @relations = Relation.where("word_id=?", params[:id])
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
