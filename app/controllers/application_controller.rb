class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :authenticate_user!

  helper_method :current_user, :logged_in?, :can_manage_clinical_data?

  private

  def authenticate_user!
    return if logged_in?

    redirect_to login_path, alert: "Please sign in to continue."
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_role!(roles)
    return if roles.include?(current_user&.role)

    redirect_to dashboard_path, alert: "You do not have access to that area."
  end

  def can_manage_clinical_data?
    current_user.present? && %w[admin doctor].include?(current_user.role)
  end
end
