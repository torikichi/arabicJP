class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :ampm
      t.integer :lv
      t.integer :category
      t.integer :lesson_no
      t.integer :lesson_seq
      t.string :lesson_name
      t.string :lesson_name_ar

      t.timestamps null: false
    end
  end
end
