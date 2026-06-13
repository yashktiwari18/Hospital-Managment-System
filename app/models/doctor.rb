class Doctor < ApplicationRecord
  belongs_to :user
  
  validates :qualification, presence: true, allow_blank: true

  validates :name,
  presence: true,
  length: { maximum: 25 }

  validates :age,
  presence: true

  validates :gender,
  presence: true

  validates :phone,
  presence: true

  validates :specialization,
  presence: true
  
  has_many :appointments
  has_many :medical_records
  has_many :bills
  has_many :prescriptions, dependent: :destroy
end
