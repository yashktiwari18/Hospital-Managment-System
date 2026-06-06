class MedicalRecordsController < ApplicationController

  def new
    appointment = Appointment.find(params[:appointment_id])

    @medical_record = MedicalRecord.new(
      appointment: appointment,
      patient: appointment.patient,
      doctor: appointment.doctor
    )
  end

  def create
    @medical_record = MedicalRecord.new(record_params)

    if @medical_record.save
      redirect_to doctor_appointments_path,
      notice: "Record saved successfully."
    else
      render :new
    end
  end

  def history
  @records =
    current_user
      .patient
      .medical_records
      .includes(:doctor)
  end

  def edit
    @medical_record = MedicalRecord.find(params[:id])
  end

  def show
    @medical_record = MedicalRecord.find(params[:id])
  end

  def update
  @medical_record = MedicalRecord.find(params[:id])

  if @medical_record.update(record_params)
    redirect_to medical_record_path(@medical_record),
                notice: "Medical Record updated successfully."
  else
    render :edit, status: :unprocessable_entity
  end
  end

  def destroy
  @medical_record = MedicalRecord.find(params[:id])

  @medical_record.destroy

  redirect_to doctor_medical_records_path,
              notice: "Record deleted successfully."
  end

  def index
  @records =
    current_user
      .doctor
      .medical_records
      .includes(:patient)
  end

  private

  def record_params
    params.require(:medical_record)
          .permit(
            :patient_id,
    :doctor_id,
    :appointment_id,
    :diagnosis,
    :prescription,
    :chief_complaint,
    :symptoms,
    :doctor_notes,
    :follow_up_date
          )
  end

end