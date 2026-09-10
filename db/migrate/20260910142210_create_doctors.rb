class CreateDoctors < ActiveRecord::Migration[7.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :license_number
      t.string :email
      t.string :phone
      t.string :availability
      t.string :status
      t.string :photo_url

      t.timestamps
    end
  end
end
