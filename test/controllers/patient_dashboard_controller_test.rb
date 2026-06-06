require "test_helper"

class PatientDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_dashboard_index_url
    assert_response :success
  end
end
