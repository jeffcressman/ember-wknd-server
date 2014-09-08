class GuestsController < ApplicationController
	def index
		@guests = Guest.all
		render json: @guests
	end

	def show
		guest = Guest.find(params[:id])
		render json: guest
	end	
end
