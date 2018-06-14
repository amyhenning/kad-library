class RemoveResourceIdChangeTypeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :resources, :type, :category
  	remove_column :resources, :resource_id, :integer
  end
end
