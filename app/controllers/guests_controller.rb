class GuestsController < ApplicationController
	def index
		@guests = Guest.all
		render json: @guests
	end

	def show
		guest = Guest.find(params[:id])
		render json: guest
	end	

	def create
		guest = Guest.create(guest_params)

		if guest.save
			render json: guest, status: :created
		else
			render json: guest.errors, status: :unprocessable_entity
		end
	end

	def update
		guest = Guest.find(params[:id])

		if guest.update_attributes(guest_params)
			render json: guest
		else
			render json: guest.errors, status: :unprocessable_entity
		end
	end

	def destroy
		guest = Guest.find(params[:id])
		guest.destroy
		head :no_content
	end

	# use strong params
	private
	def guest_params
		params.require(:guest).permit(:name, :email, :password, :registration_ids => [])
	end	
end
