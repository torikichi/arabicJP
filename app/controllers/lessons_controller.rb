class LessonsController < ApplicationController
  def home
    @words
    # @words = Word.where("root = ?", "عمل")
    # @words = nil

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

  # def levelCategoryList
  #   @lessons = Lesson.all
  # 	redirect_to '/lessons/level_category'
  # end

  def searchWords

  end

  def searchSynonym
  	
  end

  def seachAntonym
  	
  end
end
