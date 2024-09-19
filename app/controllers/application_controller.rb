class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  def current_user
    Rails.logger.info "sessssssssss#{session[:id].inspect}" if session[:user_id].present?
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
    Rails.logger.info "------------------user-------------- #{@current_user.inspect}"
    @current_user
  end
end
