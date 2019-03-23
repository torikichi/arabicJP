class ChangeNullToVersions < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :versions, :item_id, true
  end
end
