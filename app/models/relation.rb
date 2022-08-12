# frozen_string_literal: true

class Relation < ActiveRecord::Base
  belongs_to :word
  has_paper_trail

  validates :rel_id, presence: true

  def word_list(kbn, rel_id)
    Word.eager_load(:relations).where("rel_id=? and syn_ant_cd=?", rel_id, kbn).limit(10)
  end
end
