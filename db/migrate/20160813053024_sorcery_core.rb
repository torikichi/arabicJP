# frozen_string_literal: true

class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    # create_table :users do |t|
    # t.string :email,            null: false
    # t.string :crypted_password
    # t.string :salt

    # t.timestamps
    # end
    add_column :users, :email, :string, null: false, default: "example@example.com"
    add_column :users, :salt, :string
    add_column :users, :level, :integer
  end
end
