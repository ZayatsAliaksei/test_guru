class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  protected

  def after_sign_in_path_for(resource)
    flash.notice = "Welcome, #{resource.name}!"
    resource.admin? ? admin_tests_path : tests_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end

end
