class AddReconfirmableToDevise < ActiveRecord::Migration[5.0]
  def up
  	add_column :users, :unconfirmed_email, :string
  end

  def down
  	remove_column :users, :unconfirmed_email
  end
end
