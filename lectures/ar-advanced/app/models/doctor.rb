class Doctor < ActiveRecord::Base
  has_many :interns
  # def interns
  #   Intern.where(doctor_id: id)
  # end
  has_many :consultations
  has_many :patients, through: :consultations
  # def patients
  #   Patient.joins(:consultations).where(doctor_id: id)
  # end

  validates :last_name, presence: true, uniqueness: true
end