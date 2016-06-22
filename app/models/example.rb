class Example < ActiveRecord::Base
	self.primary_keys = :word_id, :exp_seq
	belongs_to :word
	has_paper_trail

	VALID_ARABIC_REGEX = /[\u0600-\u06FF]+\s*[\u0600-\u06FF]+/
	validates :sentence_ar, format: { with: VALID_ARABIC_REGEX }, allow_blank: true
	validates :ja_or_ar, presence: true
	after_validation :confirm_change_value

  private
	def ja_or_ar
	  sentence_ja.presence or sentence_ar.presence
	end

  	def confirm_change_value
  	  if !self.sentence_ja_changed? && !self.sentence_ar_changed?
  	  	errors.add(:base, NO_CHG_ERROR)
  	  else
  	  	return true
  	  end
  	end
end
