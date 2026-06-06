require "test_helper"

class TestReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_report = test_reports(:one)
  end

  test "should get index" do
    get test_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_test_report_url
    assert_response :success
  end

  test "should create test_report" do
    assert_difference("TestReport.count") do
      post test_reports_url, params: { test_report: { patient_id: @test_report.patient_id, result: @test_report.result, test_type: @test_report.test_type } }
    end

    assert_redirected_to test_report_url(TestReport.last)
  end

  test "should show test_report" do
    get test_report_url(@test_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_report_url(@test_report)
    assert_response :success
  end

  test "should update test_report" do
    patch test_report_url(@test_report), params: { test_report: { patient_id: @test_report.patient_id, result: @test_report.result, test_type: @test_report.test_type } }
    assert_redirected_to test_report_url(@test_report)
  end

  test "should destroy test_report" do
    assert_difference("TestReport.count", -1) do
      delete test_report_url(@test_report)
    end

    assert_redirected_to test_reports_url
  end
end
