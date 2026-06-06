json.extract! appointment, :id, :patient_id, :doctor_id, :date, :time, :status, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
