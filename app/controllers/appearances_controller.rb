class AppearancesController < ApplicationController
  before_action :get_lvs, only: [:new, :add_word_to_lesson, :create]
  before_action :require_login

  def new
  	@appearance = Appearance.new

    if params[:flg] == "0"
      @lessons = Lesson.eager_load(:appearances).where("word_id=?", params[:format])
    end

  end

  def add_word_to_lesson
    @appearance = Appearance.new
    @lessons = Lesson.eager_load(:appearances).where("word_id=?", params[:id])
  end

  def create
  	@appearance = Appearance.new(appearance_params)

  	if @appearance.save
  	  flash[:success] = "登場単語・LESSONを登録しました。"
  	  redirect_to action: "lesson_in_words", controller: "words", id: @appearance.appr_id
  	else
      if params[:commit] == "LESSON登録"
        @lessons = Lesson.eager_load(:appearances).where("word_id=?", params[:word_id])
        render 'add_word_to_lesson'
      else
        @choisedLesson = Lesson.find(@appearance.appr_id)
        @words = Word.eager_load(:appearances, :examples).where("appr_id=?", @appearance.appr_id).page(params[:page])
  	    render 'words/lesson_in_words'
      end
  	end
  end

  def get_lesson_list
  	@lessons = Lesson.where("edition=? and lv=? and category=?", 1, params[:lv], params[:category])
  	render
  end

  def srch_words_to_lesson
    if params[:w_t_l].nil?
      return
    end
    @words = Word.where("word = ?", params[:w_t_l])
    render
  end

  def destroy
    Appearance.find_by(appr_id: params[:id], word_id: params[:word_id]).destroy
    flash[:success] = "当LESSONから単語を削除しました。"
    redirect_to action: "lesson_in_words", controller: "words", id: params[:id]
  end

  private
  	def appearance_params
  	  params.require(:appearance).permit(:word_id, :appr_id)
  	end

    def get_lvs
      @lvs = Lesson.select("lv").where("edition=?", 1).distinct.pluck(:lv)
    end
end
