class DoctorsController < ApplicationController

  before_action :authenticate_user
  before_action :authorize_doctor

  def index
    @doctors = Doctor.page(params[:page]).per(5)
  end

  # def new
  #   @doctor = Doctor.new
  # end

  def create
   @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice: "Doctor created successfully."
    else
      render :new
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: "Doctor updated successfully."
   else
    render :edit
    end
  end

  def destroy
  @doctor = Doctor.find(params[:id])

  @doctor.destroy

  redirect_to doctors_path
end

def export 
  @doctors = Doctor.all
  respond_to do |format|
    format.xlsx
  end
end 

  private
  def doctor_params
    params.require(:doctor).permit(
  :name,
  :age,
  :gender,
  :phone,
  :address,
  :specialization,
  :education,
  :department,
  :qualification,
  :experience,
  :consultation_fee,
  :about
)
  end
end
