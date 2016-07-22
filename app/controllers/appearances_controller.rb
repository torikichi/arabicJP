class AppearancesController < ApplicationController
  def new
  	@appearance = Appearance.new
  	@lvs = Lesson.select("lv").where("edition=?", 1).distinct.pluck(:lv)

  	@categories1 = get_categories(1)
  	@categories2 = get_categories(2)
  	@categories3 = get_categories(3)
  	@categories4 = get_categories(4)
  end

  def category_select
  	@categories = Lesson.select("category").where("edition=? and lv=?", 1,1)
  end

  private
  	def appearance_params
  	  params.require(:appearance).permit(:word_id, :appr_id)
  	end

  	def get_categories(lv)
  	  Lesson.select("category").where("edition=? and lv=?", 1, lv).distinct.pluck(:category)
  	end
end
