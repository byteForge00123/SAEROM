class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :medical_records, dependent: :destroy
  has_many :prescriptions, dependent: :destroy

  validates :name, presence: true
  validates :specialty, presence: true
  validates :license_number, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :status, presence: true

  def initials
    name.to_s.split.map { |part| part[0] }.first(2).join.upcase
  end
end
