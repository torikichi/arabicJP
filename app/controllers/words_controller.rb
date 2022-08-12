# frozen_string_literal: true

class WordsController < ApplicationController
  before_action :require_login, only: %i[new create edit update]

  def index
    @q = Word.ransack(params[:q])
    if params.dig(:q, :word_cont).blank?
      flash[:danger] = "検索したい単語を入力してください"
    else
      @words = @q.result.preload(:relations, :examples, :appearances).page(params[:page])
    end

    render "/lessons/home"
  end

  # 語根検索
  def words_roots
    @words = Word.search_by_root(params[:id]).results_set

    @words = Kaminari.paginate_array(@words).page(params[:page])
    render "/lessons/home"
  end

  # 複数形検索
  def plural_from_singular
    @words = Word.get_plural(params[:id]).results_set

    @words = Kaminari.paginate_array(@words).page(params[:page])
    render "/lessons/home"
  end

  # Lessonに紐付く単語を取得
  def lesson_in_words
    @lesson = Lesson.find(params[:id])
    @words = Word.get_attached_info(@lesson.words)

    @words = @words.page(params[:page])
  end

  # Lesson毎の単語帳を出力(csv)
  def vocabulary_book
    @lesson = Lesson.find(params[:id])
    @words = @lesson.words

    respond_to do |format|
      format.csv do
        send_data render_to_string, filename: "LV#{@lesson.lv}_LESSON#{@lesson.lesson_no}_#{@lesson.lesson_name}.csv",
                                    type: :csv
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
    # 複数形の取り扱いはpendding

    if @word.save
      flash[:success] = "単語登録が完了しました！正しく登録されたか、確認してください。"
      redirect_to @word
    else
      render "new"
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
      render "edit"
    end
  end

  private

  def word_params
    params.require(:word).permit(:word, :word_with_pron, :pos, :meaning, :root)
  end
end
