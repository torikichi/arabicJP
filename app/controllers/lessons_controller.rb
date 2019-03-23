class LessonsController < ApplicationController
  def home

  end

  def index
    
  end

  def show
    @lessons = Lesson.get_lessons(params[:lv], params[:category])
  end

  def word_in_lessons
    @choisedWord = Word.find(params[:id])

    @lessons = Lesson.eager_load(:appearances).where("word_id=?", params[:id])
  end

end
