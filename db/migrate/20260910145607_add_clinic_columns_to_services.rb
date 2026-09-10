class AddClinicColumnsToServices < ActiveRecord::Migration[7.2]
  def change
    add_column :services, :name, :string
    add_column :services, :category, :string
    add_column :services, :price, :decimal
    add_column :services, :duration, :string
    add_column :services, :description, :text
  end
end
