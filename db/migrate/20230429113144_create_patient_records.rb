class CreatePatientRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_records do |t|
      t.belongs_to :hospital, foreign_key: true, null: false
      t.belongs_to :patient, foreign_key: true, null: false
      t.timestamps
    end
  end
end
