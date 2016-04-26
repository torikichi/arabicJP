class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples, id: false do |t|
      t.integer :word_id, null: false
      t.integer :exp_seq, null: false
      t.text :sentence_ja
      t.text :sentence_ar

      t.timestamps null: false
    end

    add_index :examples, [:word_id, :exp_seq], unique: true
  end
end
