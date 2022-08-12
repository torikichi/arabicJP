# frozen_string_literal: true

class AddIndexToAppearances < ActiveRecord::Migration[5.2]
  def change
    add_index :appearances, %i[word_id lesson_id], unique: true
  end
end
