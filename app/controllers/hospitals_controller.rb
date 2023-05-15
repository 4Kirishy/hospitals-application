class HospitalsController < ApplicationController
    before_action :set_hospital, only: ['pdf']
    
    def index
        if not user_signed_in?
            redirect_to root_path
        else
            @hospitals = SearchHospitalQuery.new
            @hospitals = @hospitals.search(params["search"]).page(params[:page])
            
            respond_to do |format|
                format.html
                format.csv { send_data Hospital.to_csv, filename: "hospitals-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
            end
            
            # render 'index'
        end
    end
    
    def search
        redirect_to "/hospitals?search=#{params[:search]}"
    end
    
    def export_csv
        @hospitals = Hospital.all
        
        respond_to do |format|
            
            format.csv do 
                response.headers['Content-Type'] = 'text/csv'
                response.headers['Content-Disposition'] = "attachment;filename=hospitals.csv"
                # render template: "path/to/index."
                # render template: "path/to/index.csv.erb"
            end
        end
    end
    
    def detailed
        @hospital = Hospital.includes(:departments).find(params['id'].to_i)
        render 'detailed'
    end
    
    
    def pdf
        pdf = Prawn::Document.new
        pdf.text @hospital.name, size: 32, style: :bold
        pdf.move_down 20
        pdf.text "Location: #{@hospital.city}"
        pdf.text "Type: #{@hospital.category}"
        pdf.text "Year: #{@hospital.year}"
        pdf.move_down 20
        pdf.text "Departments:", size: 16, style: :bold
        @hospital.departments.each do |dep|
            pdf.text "- #{dep.name}"
        end
        send_data(pdf.render, filename: "hospitals.pdf", type: "application/pdf", disposition: "inline")
    end
    
    
    def set_hospital
        @hospital = Hospital.includes(:departments).find(params['id'].to_i)
    end
    
    
    
        
end