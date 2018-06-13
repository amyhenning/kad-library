class AddUserToResourceAndReview < ActiveRecord::Migration[5.0]
  def change
  	add_column :resources, :user_id, :integer
  	add_index :resources, :user_id
  	add_column :reviews, :user_id, :integer
  	add_index :reviews, [:user_id, :resource_id]
  end
end
