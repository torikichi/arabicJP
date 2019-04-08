class Lesson < ActiveRecord::Base
	has_many :appearances, dependent: :destroy
	has_many :words, through: :appearances

  scope :get_lessons, ->(lv, category){ where(lv: lv, category: category) }
  scope :lessons_including_word, ->(word_id){ eager_load(:appearances).where(appearances:{word_id: word_id}).order({id: :asc}) }
end
