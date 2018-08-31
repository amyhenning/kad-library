class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@resources = Resource.where(user_id: params[:id])
		@favorites = Favorite.where(user_id: params[:id])
  end
end
