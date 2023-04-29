class HospitalsController < ApplicationController
    def index
        @hospitals = SearchHospitalQuery.new
        @hospitals = @hospitals.search(params["search"]).page(params[:page])
        render 'index'
    end
    
    def search
        redirect_to "/hospitals?search=#{params[:search]}"
    end
    
    def detailed
        @hospital = Hospital.includes(:departments).find(params['id'].to_i)
        render 'detailed'
    end
end