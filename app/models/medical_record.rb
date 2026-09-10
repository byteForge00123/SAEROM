class MedicalRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :patient, :doctor, :visit_date, :chief_complaint, presence: true
end
