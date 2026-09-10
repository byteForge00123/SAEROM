class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :medical_records, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :invoices, dependent: :destroy

  validates :patient_id, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :phone, presence: true
  validates :status, presence: true

  scope :active, -> { where(status: ["active", "new"]).or(where(archived: [false, nil])) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
