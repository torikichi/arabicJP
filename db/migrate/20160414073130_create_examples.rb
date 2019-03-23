class CreateExamples < ActiveRecord::Migration[5.2]
  def change
    create_table :examples do |t|
      t.text :sentence_ja
      t.text :sentence_ar

      t.timestamps

      t.references :word, foreign_key: true
    end
  end
end
