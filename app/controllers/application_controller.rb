class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def authenticate_admin
      if user_signed_in? && current_user.type == 'Sudo'
      else 
        flash[:alert] = "You are not an Admin"
        redirect_to root_path
      end 
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name])    
  end


private

def user_not_authorized
  flash[:notice] = "You are not an authorized user."
  redirect_to(root_path || request.referrer) 
end 
  
end
