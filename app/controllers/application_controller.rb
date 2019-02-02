class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_filter :set_current_user

  def set_current_user
    User.current = current_user
  end

  protected

  def configure_permitted_parameters
  	added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  	devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
