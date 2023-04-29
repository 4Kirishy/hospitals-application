class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.all
        render 'index'
    end
    
    def detailed
        @hospital = Hospital.find(params['id'].to_i)
        render 'detailed'
    end
end