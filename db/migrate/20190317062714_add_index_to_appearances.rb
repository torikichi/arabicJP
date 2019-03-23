class AddIndexToAppearances < ActiveRecord::Migration[5.2]
  def change
    add_index :appearances, [:word_id, :lesson_id], unique: true
  end
end
