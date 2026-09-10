class Invoice < ApplicationRecord
  belongs_to :patient
  has_many :invoice_items, dependent: :destroy

  validates :invoice_date, :amount, :payment_status, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
