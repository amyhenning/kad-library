class ChangeReviewRatingToInteger < ActiveRecord::Migration[5.0]
  def change
  	change_column :reviews, :rating, 'integer USING CAST(rating AS integer)'
  end
end
