class ReviewsController < ApplicationController
	before_action :authenticate_user!
	def create
		@resource = Resource.find(params[:resource_id])
		@resource.reviews.create(review_params.merge(user: current_user))
		redirect_to resource_path(@resource)
	end

	private

	def review_params
		params.require(:review).permit(:comment, :rating)
	end

end
