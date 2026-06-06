class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def doctor?
    current_user&.role == "doctor"
  end

helper_method :current_user, :logged_in?, :doctor?, :patient?

  def patient?
    current_user&.role == "patient"
  end

  def authenticate_user
    unless current_user
      redirect_to login_path,
      alert: "Please login first."
    end
  end

  def authorize_doctor
  unless doctor?
    redirect_to patients_path,
    alert: "Access denied."
  end
end

end