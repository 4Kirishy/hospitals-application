require 'csv'
require 'faker'

task csv: [:environment] do
    CSV.foreach(("hospitals.csv"), headers: false, col_sep: ",") do |row|
        h_name = row[0];
        h_city = row[1];
        h_type = row[3];
        h_rate = row[5];
        h_year = Faker::Date.between(from: '2000-01-01', to: '2010-12-12');
        
        hospital = Hospital.new(name: h_name, year: h_year, location: h_city, city: h_city, rating_mortality: h_rate, category: h_type)
        hospital.save
    end
end