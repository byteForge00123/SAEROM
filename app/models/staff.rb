class Staff < ApplicationRecord
  belongs_to :user

  validates :name, :role, :department, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
