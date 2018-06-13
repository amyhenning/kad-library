class ResourcesController < ApplicationController
	def index
	end

	def new
		@resource = Resource.new
	end

	def create
		@resource = Resource.create(resource_params)
		redirect_to resource_path(@resource)
	end

	def show
		@resource = Resource.find(params[:id])
	end

	private

	def resource_params
		params.require(:resource).permit(:name, :location, :website, :description)
	end
end
