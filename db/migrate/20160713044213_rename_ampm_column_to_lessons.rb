class RenameAmpmColumnToLessons < ActiveRecord::Migration
  def change
  	rename_column :lessons, :ampm, :edition
  end
end
