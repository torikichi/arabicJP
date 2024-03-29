# frozen_string_literal: true

class CreateLessons < ActiveRecord::Migration[5.2]
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
