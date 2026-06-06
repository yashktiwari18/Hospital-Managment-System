json.extract! test_report, :id, :patient_id, :test_type, :result, :created_at, :updated_at
json.url test_report_url(test_report, format: :json)
