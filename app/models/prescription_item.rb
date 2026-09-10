class PrescriptionItem < ApplicationRecord
  belongs_to :prescription

  validates :medication, :dosage, :frequency, :duration, presence: true
end
