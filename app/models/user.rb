class User < ApplicationRecord
  has_secure_password

  has_one :doctor
  has_one :patient

  validates :name,
  presence: true,
  length: { maximum: 25 }

  validates :email,
  presence: true,
  uniqueness: true

  validates :password,
  presence: true,
  length: { minimum: 6 }, if: -> { password.present? }

  validates :role,
  presence: true
end