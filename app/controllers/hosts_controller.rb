class HostsController < ApplicationController
	# Devise requires that we are authenticated before we can access this controller
	before_action :authenticate_user!
		
	def index
		@hosts = Host.all
		render json: @hosts
	end

	def show
		host = Host.find(params[:id])
		render json: host
	end	

	def create
		host = Host.create(host_params)

		if host.save
			render json: host, status: :created
		else
			render json: host.errors, status: :unprocessable_entity
		end
	end

	def update
		host = Host.find(params[:id])

		if host.update_attributes(host_params)
			render json: host
		else
			render json: host.errors, status: :unprocessable_entity
		end
	end

	def destroy
		host = Host.find(params[:id])
		host.destroy
		head :no_content
	end

	# use strong params
	private
	def host_params
		params.require(:host).permit(:name, :email)
	end	
end
