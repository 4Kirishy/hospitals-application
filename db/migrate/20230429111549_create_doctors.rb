class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.belongs_to :department, foreign_key: true, null: false
      t.belongs_to :specialty, foreign_key: true, null: false
      t.timestamps
    end
  end
end
