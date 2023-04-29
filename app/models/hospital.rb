class Hospital < ApplicationRecord
    has_many :departments, dependent: :destroy
    has_many :patient_records
end
