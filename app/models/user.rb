class User < ApplicationRecord
  has_secure_password

  enum :role, { admin: "admin", doctor: "doctor", receptionist: "receptionist" }, suffix: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true
  validates :password, length: { minimum: 6 }, if: :password_digest_changed?

  has_many :staffs, dependent: :destroy

  def initials
    name.to_s.split.map { |part| part[0] }.first(2).join.upcase
  end
end
