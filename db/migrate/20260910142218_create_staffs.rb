class CreateStaffs < ActiveRecord::Migration[7.2]
  def change
    create_table :staffs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :role
      t.string :department
      t.string :email
      t.string :phone
      t.string :status

      t.timestamps
    end
  end
end
