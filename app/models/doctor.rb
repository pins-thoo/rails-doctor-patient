class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  validates :name, presence: true
  validates :specialty, presence: true
end
