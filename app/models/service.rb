class Service < ApplicationRecord
  has_many :invoice_items, dependent: :destroy

  validates :name, presence: true
  validates :category, :price, :duration, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
