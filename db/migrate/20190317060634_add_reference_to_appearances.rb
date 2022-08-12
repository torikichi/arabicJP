# frozen_string_literal: true

class AddReferenceToAppearances < ActiveRecord::Migration[5.2]
  def change
    add_reference :appearances, :word, foreign_key: true
    add_reference :appearances, :lesson, foreign_key: true
  end
end
