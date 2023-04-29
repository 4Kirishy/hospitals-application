class Doctor < ApplicationRecord
    belongs_to :department
    belongs_to :specialty
    
    has_one :department
    has_one :specialty
end
