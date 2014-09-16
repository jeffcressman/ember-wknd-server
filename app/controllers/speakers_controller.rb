class SpeakersController < ApplicationController
	def index
		@speakers = Speaker.all
		render json: @speakers
	end

	def show
		speaker = Speaker.find(params[:id])
		render json: speaker
	end

	def create
		speaker = Speaker.create(speaker_params)

		if speaker.save
			render json: speaker, status: :created
		else
			render json: speaker.errors, status: :unprocessable_entity
		end
	end

	def update
		speaker = Speaker.find(params[:id])

		if speaker.update_attributes(speaker_params)
			render json: speaker
		else
			render json: speaker.errors, status: :unprocessable_entity
		end
	end

	def destroy
		speaker = Speaker.find(params[:id])
		speaker.destroy
		head :no_content
	end

	# use strong params
	private
	def speaker_params
		params.require(:speaker).permit(:name, :bio, :workshop_ids => [])
	end
end
