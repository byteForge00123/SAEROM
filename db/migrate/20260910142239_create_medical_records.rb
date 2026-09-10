class CreateMedicalRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :medical_records do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.date :visit_date
      t.text :chief_complaint
      t.text :symptoms
      t.text :diagnosis
      t.text :treatment
      t.text :clinical_notes
      t.text :follow_up_instructions

      t.timestamps
    end
  end
end
