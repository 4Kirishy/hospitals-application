class SearchHospitalQuery
    def initialize(hospitals = Hospital.all.order(:name))
        @hospitals = hospitals
    end
    
    def search(value="")
        @hospitals.where("name LIKE ?", "%#{value}%")
    end
end