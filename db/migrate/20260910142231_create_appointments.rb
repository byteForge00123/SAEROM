class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.date :appointment_date
      t.time :start_time
      t.time :end_time
      t.string :appointment_type
      t.text :reason_for_visit
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
