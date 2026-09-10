class AddClinicColumnsToInvoices < ActiveRecord::Migration[7.2]
  def change
    add_column :invoices, :patient_id, :bigint
    add_index :invoices, :patient_id
    add_column :invoices, :invoice_date, :date
    add_column :invoices, :amount, :decimal
    add_column :invoices, :payment_status, :string
    add_column :invoices, :notes, :text
  end
end
