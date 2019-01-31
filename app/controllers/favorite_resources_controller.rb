class FavoriteResourcesController < ApplicationController
	before_action :set_resource

	def create
		@favorite_resource = Favorite.create(favorited: @resource, user: current_user)
		if @favorite_resource.save
			respond_to do |format|
				# format.html {redirect_to :back, notice: "Bookmarked!"}
				format.js
			end
		end
	end

	def destroy
		@unfavorited_resource = Favorite.where(favorited_id: @resource.id, user_id: current_user.id).first
		if @unfavorited_resource.destroy
			respond_to do |format|
				# format.html {redirect_to :back, notice: "Bookmark removed."}
				format.js
			end
		end
	end

	private

	def set_resource
		@resource = Resource.find(params[:resource_id] || params[:id])
	end
end
