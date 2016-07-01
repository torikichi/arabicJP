class Relation < ActiveRecord::Base
	self.primary_keys = :rel_id, :word_id, :syn_ant_cd
	belongs_to :from_word, class_name: Word, foreign_key: [:word_id]
	has_paper_trail

  def word_list(kbn, relId)
  	Word.eager_load(:relations).where("rel_id=? and syn_ant_cd=?", relId, kbn).limit(10)
  end

end
