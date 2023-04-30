class HospitalsController < ApplicationController
    def index
        if not user_signed_in?
            redirect_to root_path
        else
            @hospitals = SearchHospitalQuery.new
            @hospitals = @hospitals.search(params["search"]).page(params[:page])
            render 'index'
        end
    end
    
    def search
        redirect_to "/hospitals?search=#{params[:search]}"
    end
    
    def detailed
        @hospital = Hospital.includes(:departments).find(params['id'].to_i)
        render 'detailed'
    end
end