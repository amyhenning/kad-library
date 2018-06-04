class AlterResourcesAddType < ActiveRecord::Migration[5.0]
  def change
  	add_column :resources, :type, :string
  end
end
