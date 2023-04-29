require 'faker'

task fill_departments: [:environment] do
    
    Hospital.count.times do |i|
        d_name = Faker::Company.department
        d_hospital = Hospital.find(i+2)
        
        department = Department.new(name: d_name, hospital: d_hospital)
        department.save
    end
    
end