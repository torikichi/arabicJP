# frozen_string_literal: true

class Appearance < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson
  has_paper_trail
end
