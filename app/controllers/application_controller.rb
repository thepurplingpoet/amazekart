class ApplicationController < ActionController::Base
  before_action :authenticate_user! , except: [:home, :show, :contact, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :seller])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :seller, :password, :current_password) }

  end

end
