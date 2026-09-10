class AddServiceRefToInvoiceItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :invoice_items, :invoice, null: false, foreign_key: true
    add_reference :invoice_items, :service, null: false, foreign_key: true
    add_column :invoice_items, :description, :string
    add_column :invoice_items, :quantity, :integer
    add_column :invoice_items, :unit_price, :decimal
  end
end
