class RenameHospitalTypeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :hospitals, :type, :category
  end
end
