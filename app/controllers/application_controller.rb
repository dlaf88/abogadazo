class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def authenticate_admin
      if account_signed_in? && current_account.type == 'Boss'
      else 
        flash[:alert] = "You are not an Admin"
        redirect_to root_path
      end 
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name,:last_name]
  end
end
