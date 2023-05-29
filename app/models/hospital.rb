require 'csv'
class Hospital < ApplicationRecord
    has_many :departments, dependent: :destroy
    has_many :patient_records
    
    has_one_attached :image, :dependent => :destroy
    

    validates :name, presence: true
    validates :location, presence: true
    validates :year, presence: true
    
    
 
    def self.to_csv
     hospitals = all
     CSV.generate do |csv|
       csv << column_names
       hospitals.each do |hospital|
         csv << hospital.attributes.values_at(*column_names)
       end
     end
    end
end
