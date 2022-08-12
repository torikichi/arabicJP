# frozen_string_literal: true

class LessonsController < ApplicationController
  def home
    @q = Word.ransack(params[:q])
    # @words = @q.result.page(params[:page])
  end

  def index; end

  def show
    @lessons = Lesson.get_lessons(params[:lv], params[:category])
  end

  def word_in_lessons
    @choised_word = Word.find(params[:id])

    @lessons = Lesson.preload(:appearances).where(word_id: params[:id])
  end
end
