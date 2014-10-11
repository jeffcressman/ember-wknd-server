class SessionsController < Devise::SessionsController

  def create
    respond_to do |format|
      format.html { super }
      format.json do
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        data = {
          user_token: self.resource.authentication_token,
          user_email: self.resource.email,
          user_type:  self.resource.type,
          user_id:    self.resource.id
        }
        render json: data, status: 201
      end
    end
  end

  # Return the current user
  # An alternative to looking up the current user from 
  # Ember once authenticated and have the current users id returned
  # in the create method above.
  #
  # Doesn't work yet.
  # Returns null
  def current
  	render json: current_user
  end

end