class Appearance < ActiveRecord::Base
	self.primary_keys = :word_id, :appr_id
	belongs_to :word,
		foreign_key: [:word_id]
	belongs_to :lesson,
		foreign_key: [:appr_id]
end
