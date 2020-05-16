class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  validates :name, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true }
end
