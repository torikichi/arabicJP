class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
    	t.string :word, null: false
    	t.string :word_with_pron, null: false
    	t.string :pos
    	t.text :meaning, null: false
    	t.string :root
    	t.integer :plural_cd
    	t.integer :plural_ord

    	t.timestamps null: false
    end

  	add_index :words, [:word, :word_with_pron, :meaning, :root]
  end
end
