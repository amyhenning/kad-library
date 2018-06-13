class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
    	t.text :comment
    	t.string :rating
    	t.integer :resource_id
      t.timestamps
    end

    add_index :reviews, :resource_id
  end
end
