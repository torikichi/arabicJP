# frozen_string_literal: true

class RenameAmpmColumnToLessons < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :ampm, :edition
  end
end
