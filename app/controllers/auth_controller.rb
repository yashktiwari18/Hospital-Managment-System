class AuthController < ApplicationController
  def login
  @user = User.new
end

  def signup
    @user = User.new
  end

  def create
  @user = User.new(user_params)

  unless @user.save
    render :signup, status: :unprocessable_entity
    return
  end

  if @user.role == "doctor"
    doctor = Doctor.new(
  user: @user,
  name: @user.name,
  age: params[:user][:age],
  gender: params[:user][:gender],
  phone: params[:user][:phone],
  specialization: params[:user][:specialization],
  education: params[:user][:education],
  field: params[:user][:field],
  department: params[:user][:department],
  experience: params[:user][:experience],
  consultation_fee: params[:user][:consultation_fee],
  about: params[:user][:about]
)

    unless doctor.save
      @user.destroy
      @user.errors.add(
        :base,
        doctor.errors.full_messages.join(", ")
      )
      render :signup,
             status: :unprocessable_entity
      return
    end

  elsif @user.role == "patient"

    patient = Patient.new(
      user: @user,
      name: @user.name
    )

    unless patient.save
      @user.destroy
      @user.errors.add(
        :base,
        patient.errors.full_messages.join(", ")
      )
      render :signup,
             status: :unprocessable_entity
      return
    end

  end

  redirect_to login_path,
              notice: "Signup successful. Please log in."
end

  def authenticate
  user = User.find_by(
    email: params[:user][:email],
    role: params[:user][:role]
  )

  if user&.authenticate(params[:user][:password])
    session[:user_id] = user.id

    if user.role == "doctor"
      redirect_to dashboard_path
    else
      redirect_to patient_dashboard_path
    end

  else
    flash.now[:alert] = "Invalid Email or Password."
    @user = User.new
    render :login, status: :unprocessable_entity
  end
end


def logout
  reset_session

  redirect_to root_path,
  notice: "Logged out successfully."
end

    def select_login_role
  end

    def select_signup_role
  end

  private
 def user_params
  params.require(:user).permit(
    :name,
    :email,
    :password,
    :password_confirmation,
    :role
  )
end
end
