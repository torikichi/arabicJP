class ChangeNullToVersions < ActiveRecord::Migration
  def change
  	change_column_null :versions, :item_id, true
  end
end
