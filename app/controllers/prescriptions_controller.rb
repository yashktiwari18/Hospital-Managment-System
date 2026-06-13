class PrescriptionsController < ApplicationController

  def index
  end

  def show
  @prescription = Prescription.find(params[:id])
end

  def new
  @prescription = Prescription.new
  @patients = Patient.all.order(:name)
end

  def create
  @prescription = Prescription.new(prescription_params)
  @prescription.doctor = current_user.doctor

  if @prescription.save
  puts "SAVE SUCCESS"
  redirect_to @prescription
else
  puts "SAVE FAILED"
  puts @prescription.errors.full_messages
  @patients = Patient.all.order(:name)
  render :new
end
end

  def edit
  end

  def update
  end

  def destroy
  end

  private

def prescription_params
  params.require(:prescription).permit(
    :patient_id,
    :doctor_id,
    :appointment_id,
    :medicine_name,
    :dosage,
    :frequency,
    :duration,
    :remarks
  )
end

end