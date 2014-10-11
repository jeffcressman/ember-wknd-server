class UsersController < ApplicationController
	# Devise requires that we are authenticated before we can access this controller
	before_action :authenticate_user!
	
	def show
		user = User.find(params[:id])
		render json: user, root: false
	end

end
