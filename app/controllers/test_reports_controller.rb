class TestReportsController < ApplicationController
  before_action :set_test_report, only: %i[ show edit update destroy ]

  # GET /test_reports or /test_reports.json
  def index
    @test_reports = TestReport.all
  end

  # GET /test_reports/1 or /test_reports/1.json
  def show
  end

  # GET /test_reports/new
  def new
    @test_report = TestReport.new
  end

  # GET /test_reports/1/edit
  def edit
  end

  # POST /test_reports or /test_reports.json
  def create
    @test_report = TestReport.new(test_report_params)

    respond_to do |format|
      if @test_report.save
        format.html { redirect_to @test_report, notice: "Test report was successfully created." }
        format.json { render :show, status: :created, location: @test_report }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @test_report.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /test_reports/1 or /test_reports/1.json
  def update
    respond_to do |format|
      if @test_report.update(test_report_params)
        format.html { redirect_to @test_report, notice: "Test report was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @test_report }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @test_report.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /test_reports/1 or /test_reports/1.json
  def destroy
    @test_report.destroy!

    respond_to do |format|
      format.html { redirect_to test_reports_path, notice: "Test report was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_report
      @test_report = TestReport.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def test_report_params
      params.expect(test_report: [ :patient_id, :test_type, :result ])
    end
end
