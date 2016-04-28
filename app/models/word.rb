class Word < ActiveRecord::Base
	has_many :appearances, foreign_key: [:word_id], dependent: :delete_all
	has_many :lessons, through: :appearance
	has_many :examples, foreign_key: [:word_id], dependent: :delete_all
	has_many :relations, foreign_key: [:word_id], dependent: :delete_all
	has_many :synonym, through: :relations, source: :to_word

end
