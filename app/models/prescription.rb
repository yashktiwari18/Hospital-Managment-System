class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :appointment
end