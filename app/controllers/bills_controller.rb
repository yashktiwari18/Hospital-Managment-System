class BillsController < ApplicationController

  def index
    if current_user.role == "patient"
      @bills = current_user.patient.bills
    else
      @bills = current_user.doctor.bills
    end
  end

  def show
    @bill = Bill.find(params[:id])
  end

end