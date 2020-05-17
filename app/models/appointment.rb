class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  validates :date, presence: true, uniqueness: true
  validates :doctor, uniqueness: { scope: :patient }
  validates :doctor, uniqueness: { scope: :date }
end
