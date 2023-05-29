class ChangeHospitals < ActiveRecord::Migration[7.0]
  def change
    add_column :hospitals, :type, :string
    add_column :hospitals, :city, :string
    add_column :hospitals, :rating_mortality, :string
  end
end
