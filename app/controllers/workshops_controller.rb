class WorkshopsController < ApplicationController
	def index
		@workshops = Workshop.all
		render json: @workshops
	end

	def show
		workshop = Workshop.find(params[:id])
		render json: workshop
	end	
end
