class ApplicationController < ActionController::API
	# This should be included in next version of Rails API
	include ActionController::StrongParameters
	include ActionController::MimeResponds
	include ActionController::RequestForgeryProtection
	include ActionController::HttpAuthentication::Token::ControllerMethods

	# include ActionController::ImplicitRender

	before_filter :authenticate_user_from_token!

	protect_from_forgery with: :null_session

	# Didn't end up using this but instead of trying to look up our user in Ember
	# based on the authenticated users email address we could simply ask Rails for
	# the current user based on the authentication token.
	# def current_user
	#    @current_user ||= begin
	#      auth_token = request.env['HTTP_X_AUTHENTICATION_TOKEN']
	#      Account.find_by(auth_token: auth_token) if !!auth_token
	#    end
	#  end

	private

		def authenticate_user_from_token!
			authenticate_with_http_token do |token, options|
				user_email = options[:user_email].presence
				user       = user_email && User.find_by_email(user_email)

				if user && Devise.secure_compare(user.authentication_token, token)
					sign_in user, store: false
				end
			end
		end	
end