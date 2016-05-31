class LessonsController < ApplicationController
  def home
    @words

  end

  def index
    # @lessons = Lesson.all
    
  end

  def show
    # LV表示用のオブジェクト
    @disp_obj = Lesson.find_by(lv: params[:lv],category: params[:category])
    # lesson一覧
    @lessons = Lesson.where(["lv = ? and category = ?", params[:lv],params[:category]])

  end

  def word_in_lessons
    @choisedWord = Word.find(params[:id])

    @lessons = Lesson.eager_load(:appearances).where("word_id=?", params[:id])

  end

end
