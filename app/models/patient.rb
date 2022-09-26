class Patient < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.over_18_by_name
    where("age >= 18").order(name: :asc)
  end
end
