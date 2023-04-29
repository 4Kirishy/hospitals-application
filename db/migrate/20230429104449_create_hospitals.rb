class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.date :year, null: false
      t.timestamps
    end
  end
end
