class Intern < ActiveRecord::Base
  belongs_to :doctor
  has_many :consultations, through: :doctor
  has_many :patients, through: :consultations
end