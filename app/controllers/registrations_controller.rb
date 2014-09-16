class RegistrationsController < ApplicationController

	def index
		@registrations = Registration.all
		render json: @registrations
	end

	def show
		registration = Registration.find(params[:id])
		render json: registration
	end

	def create
		registration = Registration.create(registration_params)

		if registration.save
			render json: registration, status: :created
		else
			render json: registration.errors, status: :unprocessable_entity
		end
	end

	def update
		registration = Registration.find(params[:id])

		if registration.update_attributes(registration_params)
			render json: registration
		else
			render json: registration.errors, status: :unprocessable_entity
		end
	end

	def destroy
		registration = Registration.find(params[:id])
		registration.destroy
		head :no_content
	end

	# use strong params
	private
	def registration_params
		params.require(:registration).permit(:name, :guest_id, :workshop_id)
	end
end
