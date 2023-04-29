class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.order(:name).page(params[:page])
        render 'index'
    end
    
    def detailed
        @hospital = Hospital.find(params['id'].to_i)
        render 'detailed'
    end
end