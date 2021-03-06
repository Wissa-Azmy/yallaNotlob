require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    protected
    def configure_permitted_parameters
	 	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation) }
	 	devise_parameter_sanitizer.for(:edit) { |u| u.permit(:user_name, :email, :password, :password_confirmation, :current_password) }
	end

end
