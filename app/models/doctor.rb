class Doctor < ApplicationRecord
    belongs_to :department
    belongs_to :specialty
    
    has_one :department
    has_one :specialty
    
    def to_s
        first_name
    end
end
