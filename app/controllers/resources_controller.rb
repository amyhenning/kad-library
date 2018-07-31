class ResourcesController < ApplicationController
	 before_action :authenticate_user!, only: [:new, :create]

	def index
		@resource_category = params[:resource_category]
		if params[:resource_category]
			@resources = Resource.where(resource_category: params[:resource_category])
		else
			@resources = Resource.all.order(:resource_category)
		end
	end

	def new
		@resource = Resource.new
	end

	def create
		@resource = Resource.create(resource_params.merge({ "user_id" => current_user.id}))
#		binding.pry
		redirect_to resource_path(@resource)
	end

	def show
		@resource = Resource.find(params[:id])
	end

	def edit
		@resource = Resource.find(params[:id])
	end

	def update
		@resource = Resource.find(params[:id])
		@resource.update_attributes(resource_params)
		redirect_to resource_path(@resource), notice: 'Resource updated'
	end

	private

	def resource_params
		params.require(:resource).permit(:name, :location, :website, :description, :resource_category)
	end
end
