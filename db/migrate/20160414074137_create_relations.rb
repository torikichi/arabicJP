class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations, id: false do |t|
      t.integer :rel_id, null: false
      t.integer :word_id, null: false
      t.integer :syn_ant_cd, null: false
      t.integer :ant_contrast_cd
      t.string :type_name

      t.timestamps null: false
    end

    add_index :relations, [:rel_id, :word_id, :syn_ant_cd], unique: true
  end
end
