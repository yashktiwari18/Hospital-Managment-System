class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one :bill, dependent: :destroy
  before_create :set_default_status
  has_one :medical_record, dependent: :destroy
  has_one :prescription, dependent: :destroy

  private

  def set_default_status
    self.status = "Pending" if status.blank?
  end
end
