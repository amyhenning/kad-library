class ResourcesController < ApplicationController
	 before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		if params[:resource_category] == nil
			@resource_category = nil
		else
			@resource_category = Resource.resource_categories.invert[params[:resource_category].to_i]
		end
		# binding.pry
		if params[:resource_category]
			@resources = Resource.where(resource_category: params[:resource_category]).paginate(page: params[:page], per_page: 9)
		else
			@resources = Resource.all.order(:resource_category).paginate(page: params[:page], per_page: 9)
		end
	end

	def new
		@resource = Resource.new
	end

	def create
		@resource = Resource.create(resource_params.merge({ "user_id" => current_user.id}))
		if @resource.valid?
			redirect_to resource_path(@resource)
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
		@resource = Resource.find(params[:id])
		@review = Review.new
	end

	def edit
		@resource = Resource.find(params[:id])
		if @resource.user != current_user
			return render plain: 'Not allowed', status: :forbidden
		end
	end

	def update
		@resource = Resource.find(params[:id])
		if @resource.user != current_user
			return render plain: 'Not allowed', status: :forbidden
		end

		@resource.update_attributes(resource_params)
		if @resource.valid?
			redirect_to resource_path(@resource), notice: 'Resource updated'
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@resource = Resource.find(params[:id])
		if @resource.user != current_user
			return render plain: 'Not allowed', status: :forbidden
		end
		@resource.destroy
		redirect_to resources_path, notice: 'Resource deleted'
	end

	private

	def resource_params
		params.require(:resource).permit(:name, :location, :website, :description, :resource_category)
	end
end
