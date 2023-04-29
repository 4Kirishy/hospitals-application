require 'nokogiri'
require 'open-uri'
require 'faker'

task fill_hospitals: [:environment] do
    doc = Nokogiri::HTML(URI.open('https://www.hospitalsafetygrade.org/all-hospitals'))
    doc.css('.content div div div ul li a').each do |a|
        h_name = a.content
        h_year = Faker::Date.between(from: '2000-01-01', to: '2010-12-12')
        h_location = Faker::Address.city
        
        hospital = Hospital.new(name: h_name, year: h_year, location: h_location)
        hospital.save
    end
end