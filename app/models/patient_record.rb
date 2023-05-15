class PatientRecord < ApplicationRecord
    belongs_to :patient
    belongs_to :hospital
    
    # has_one :patient
end
