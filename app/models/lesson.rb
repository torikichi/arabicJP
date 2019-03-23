class Lesson < ActiveRecord::Base
	has_many :appearances, dependent: :destroy
	has_many :words, through: :appearances

  scope :get_lessons, ->(lv, category){ where(lv: lv, category: category) }
end
