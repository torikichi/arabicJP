class Example < ActiveRecord::Base
	self.primary_keys = :word_id, :exp_seq
	belongs_to :word
	has_paper_trail
end
