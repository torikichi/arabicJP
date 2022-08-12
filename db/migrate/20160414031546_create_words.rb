# frozen_string_literal: true

class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word, null: false
      t.string :word_with_pron, null: false
      t.string :pos
      t.text :meaning, null: false
      t.string :root
      t.integer :plural_word_id

      t.timestamps null: false
    end

    add_index :words, %i[word word_with_pron meaning root]
  end
end
