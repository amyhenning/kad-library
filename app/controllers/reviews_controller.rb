class ReviewsController < ApplicationController
	before_action :authenticate_user!
	def create
		@resource = Resource.find(params[:resource_id])
		@resource.reviews.create(review_params.merge(user: current_user))
	end

	private

	def review_params
		params.require(:review).permit(:comment, :rating)
	end

end
