class CreateDoctorPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_patients do |t|
      t.references :doctor
      t.references :patient
      t.timestamps
    end

    remove_reference :doctors, :patient, foreign_key: true
  end
end
