class WorkshopsController < ApplicationController

	def index
		@workshops = Workshop.all
		render json: @workshops
	end

	def show
		workshop = Workshop.find(params[:id])
		render json: workshop
	end	

	def create
		workshop = Workshop.create(workshop_params)

		if workshop.save
			render json: workshop, status: :created
		else
			render json: workshop.errors, status: :unprocessable_entity
		end
	end

	def update
		workshop = Workshop.find(params[:id])

		if workshop.update_attributes(workshop_params)
			render json: workshop
		else
			render json: workshop.errors, status: :unprocessable_entity
		end
	end

	def destroy
		workshop = Workshop.find(params[:id])
		workshop.destroy
		head :no_content
	end

	# use strong params
	private
	def workshop_params
		params.require(:workshop).permit(:name, :description, :registration_ids => [])
	end	
end
