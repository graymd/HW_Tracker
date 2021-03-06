class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ location_course_ids: [] }, :username, :email, :first_name, :last_name, :github_account, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ location_course_ids: [] }, :username, :email, :first_name, :last_name, :github_account, :password, :current_password) }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
