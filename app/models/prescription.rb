class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_many :prescription_items, dependent: :destroy

  validates :patient, :doctor, :prescribed_on, presence: true

  accepts_nested_attributes_for :prescription_items, allow_destroy: true
end
