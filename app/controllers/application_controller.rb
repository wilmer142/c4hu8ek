class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def basic_auth
  	email = request.headers['HTTP_X_USER_EMAIL']
  	email = request.headers['HTTP_X_API_TOKEN']
    user = User.find_by_email(email)
    if user.auth_token == token
      sign_in user
    else
    	head 401
    end
	  
  end
end
