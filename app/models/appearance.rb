class Appearance < ActiveRecord::Base
	self.primary_keys = :word_id, :appr_id
	belongs_to :word,
		foreign_key: [:word_id]
	belongs_to :lesson,
		foreign_key: [:appr_id]
	has_paper_trail

	include ActiveModel::Validations

	validates :word_id, presence: true
	validates :appr_id, presence: true
	validates_with AppearanceValidator
end
