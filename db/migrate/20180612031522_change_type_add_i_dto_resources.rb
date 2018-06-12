class ChangeTypeAddIDtoResources < ActiveRecord::Migration[5.0]
  def change
  	change_column :resources, :type, :integer, using: 'type::integer'
  	add_column :resources, :resource_id, :integer
  end
end
