class Hospital < ApplicationRecord
    has_many :departments, dependent: :destroy
end
