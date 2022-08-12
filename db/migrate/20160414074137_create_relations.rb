# frozen_string_literal: true

class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.integer :rel_id, null: false
      t.integer :lock_version, default: 0, null: false
      t.integer :syn_ant_cd, null: false
      t.integer :ant_contrast_cd
      t.string :type_name

      t.timestamps

      t.references :word, foreign_key: true
    end

    add_index :relations, %i[rel_id word_id syn_ant_cd], unique: true
  end
end
