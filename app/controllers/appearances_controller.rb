# frozen_string_literal: true

class AppearancesController < ApplicationController
  before_action :get_lvs, only: %i[new add_word_to_lesson create]
  before_action :require_login

  def new
    @appearance = Appearance.new

    @lessons = Lesson.lessons_including_word(params[:format]) if params[:flg] == "0"
  end

  def add_word_to_lesson
    @appearance = Appearance.new
    @lessons = Lesson.lessons_including_word(params[:id])
  end

  def create
    appearance = Appearance.new(appearance_params)

    if appearance.save
      flash[:success] = "登場単語・LESSONを登録しました。"
      redirect_to action: "lesson_in_words", controller: "words", id: @appearance.appr_id
    elsif params[:commit] == "LESSON登録"
      @lessons = Lesson.eager_load(:appearances).where("word_id=?", params[:word_id])
      render "add_word_to_lesson"
    else
      @choised_lesson = Lesson.find(appearance.appr_id)
      @words = Word.eager_load(:appearances, :examples).where("appr_id=?", @appearance.appr_id).page(params[:page])
      render "words/lesson_in_words"
    end
  end

  def lesson_list
    @lessons = Lesson.where("edition=? and lv=? and category=?", 1, params[:lv], params[:category])
    render
  end

  def srch_words_to_lesson
    return if params[:w_t_l].nil?

    @words = Word.where("word = ?", params[:w_t_l])
    render
  end

  def destroy
    Appearance.find_by(lesson_id: params[:id], word_id: params[:word_id]).destroy
    flash[:success] = "当LESSONから単語を削除しました。"
    redirect_to action: "lesson_in_words", controller: "words", id: params[:id]
  end

  private

  def appearance_params
    params.require(:appearance).permit(:word_id, :lesson_id)
  end

  def levels
    @levels = Lesson.select("lv").where("edition=?", 1).distinct.pluck(:lv)
  end
end
