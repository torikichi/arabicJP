class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances, id: false do |t|
      t.integer :word_id, null: false
      t.integer :appr_id, null: false

      t.timestamps null: false
    end

    add_index :appearances, [:word_id, :appr_id], unique: true
  end
end
