class Lesson < ActiveRecord::Base
	has_many :appearances, foreign_key: [:appr_id]
	has_many :words, through: :appearance
end
