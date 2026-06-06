class PatientsController < ApplicationController

  before_action :authenticate_user
  before_action :authorize_doctor,
only: [
  :new,
  :create,
  :edit,
  :update,
  :destroy
]

 def index
  if doctor?
    @patients = Patient.page(params[:page]).per(5)
  else
    @patients = Patient.where(user_id: current_user.id)
                       .page(params[:page])
                       .per(5)
  end
end

  def new
    @patient = Patient.new
  end

  def create
   @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: "Patient created successfully."
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to patients_path, notice: "Patient updated successfully."
   else
    render :new, status: :unprocessable_entity
    end
  end

  def destroy
  @patient = Patient.find(params[:id])

  @patient.destroy

  redirect_to patients_path
end

def export
  @patients = Patient.all
  respond_to do |format|
    format.xlsx
  end
end

  private
  def patient_params
    params.require(:patient).permit(
    :name,
    :age,
    :gender,
    :phone,
    :address,
    :blood_group,
    :dob,
    :emergency_contact,
    :allergies,
    :medical_history
    )
  end
end
