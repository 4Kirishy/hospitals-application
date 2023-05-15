class Patient < ApplicationRecord
    # has_one :patient_record
    
    def to_s
        first_name + " " + last_name
    end
end
