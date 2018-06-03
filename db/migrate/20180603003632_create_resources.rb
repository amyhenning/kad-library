class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
    	t.string :name
    	t.string :location
    	t.string :website
    	t.text :description
      t.timestamps
    end
  end
end
