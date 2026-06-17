class PrescriptionsController < ApplicationController

  def index
  end

  def show
  @prescription = Prescription.find(params[:id])
end

  def new
  @patient = Patient.find(params[:patient_id])
  @prescription = Prescription.new
end

  def create
  @prescription = Prescription.new(prescription_params)
  @prescription.doctor = current_user.doctor

  if @prescription.save
  redirect_to patient_path(@prescription.patient),
                notice: "Prescription created successfully."
else
  puts "====================="
  puts "SAVE FAILED"
  puts @prescription.errors.full_messages
  puts @prescription.inspect
  puts "====================="

  @patient = Patient.find(params[:prescription][:patient_id])
  flash.now[:alert] = @prescription.errors.full_messages.join(", ")

  render :new, status: :unprocessable_entity
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