class Patient < ApplicationRecord
  has_many :appointments
  has_many :medical_records
  belongs_to :user
  belongs_to :room, optional: true
  has_many :bills
  validates :name, presence: true,

    length: {
    maximum: 25,
    message: "should not be greater than 25 characters"
  }

  

  
  

end