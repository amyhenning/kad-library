class ChangeCategoryName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :resources, :category, :resource_category
  end
end
