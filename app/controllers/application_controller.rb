class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	@current_user ||= Student.find session[:current_user_id] if session[:current_user_id]
  end

  def authenticate_user
  	redirect_to login_path, flash: {error: 'Need to Login.'} unless session[:current_user_id].present?
  end 
end
