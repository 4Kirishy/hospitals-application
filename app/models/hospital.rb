class Hospital < ApplicationRecord
    has_many :departments, dependent: :destroy
    has_many :patient_records

    validates :name, presence: true
    validates :location, presence: true
    validates :year, presence: true
end
