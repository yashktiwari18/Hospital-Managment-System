class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]
  before_action :authorize_doctor,
              only: [:doctor_appointments]
  
  def index
    if patient?
  @appointments = current_user
                    .patient
                    .appointments
else
  @appointments = Appointment.all
end
  end

  
  def show
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

 
  def create
    @appointment = Appointment.new(appointment_params)
    if patient?
     @appointment.patient_id = current_user.patient.id
    end
    respond_to do |format|
      if @appointment.save

         Bill.create(
          appointment: @appointment,
          amount: 500,
          status: "Pending"
        )

        format.html { redirect_to @appointment, notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @appointment.errors, status: :unprocessable_content }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)

  if @appointment.status == "Completed" &&
     @appointment.bill.blank?

    Bill.create!(
      appointment: @appointment,
      patient: @appointment.patient,
      doctor: @appointment.doctor,
      amount: 2000,
      payment_method: "Cash",
      status: "Pending"
    )

  end

  format.html {
    redirect_to @appointment,
    notice: "Appointment was successfully updated.",
    status: :see_other
  }

  format.json {
    render :show,
    status: :ok,
    location: @appointment
  }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @appointment.errors, status: :unprocessable_content }
      end
    end
  end

  
  def destroy
    @appointment.destroy!

    respond_to do |format|
      format.html { redirect_to appointments_path, notice: "Appointment was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def confirm
  @appointment.update(status: "Confirmed")

  Bill.create(
    appointment: appointment,
    patient: appointment.patient,
    doctor: appointment.doctor,
    amount: 2000,
    payment_method: "Cash",
    status: "Pending"
  )

    redirect_to @appointment
  end

  def patient_appointments
  @appointments =
    current_user
      .patient
      .appointments
      .includes(:doctor)
end

  def doctor_appointments
  @appointments =
    current_user
      .doctor
      .appointments
      .includes(:patient)
end

  private
    def set_appointment
      @appointment = Appointment.find(params.expect(:id))
    end

    def appointment_params
      params.expect(appointment: [ :doctor_id, :date, :time, :status ])
    end

    def authorize_patient
      unless current_user.role == "patient"
         redirect_to dashboard_path, alert: "Only patients can book appointments."
  end

  def authorize_doctor
  unless current_user.role == "doctor"
    redirect_to root_path
  end
end
end
end
