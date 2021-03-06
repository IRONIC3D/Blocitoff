class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :discard_flash_if_xhr
 
  def after_sign_in_path_for(resource)
    todos_path
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def discard_flash_if_xhr
    flash.discard if request.xhr?
  end
end
