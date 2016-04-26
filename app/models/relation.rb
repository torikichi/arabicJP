class Relation < ActiveRecord::Base
	self.primary_keys = :rel_id, :word_id, :syn_ant_cd
	belongs_to :from_word, class_name: Word, foreign_key: [:word_id]

end
