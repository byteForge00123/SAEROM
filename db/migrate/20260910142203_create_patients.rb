class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :patient_id
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :phone
      t.string :email
      t.text :address
      t.string :emergency_contact
      t.string :blood_type
      t.text :allergies
      t.string :status
      t.date :registration_date
      t.boolean :archived

      t.timestamps
    end
  end
end
