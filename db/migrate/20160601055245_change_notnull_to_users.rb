class ChangeNotnullToUsers < ActiveRecord::Migration
  def change
  	change_column_null :users, :name, false
  	add_index :users, :name
  end
end
