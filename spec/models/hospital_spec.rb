require 'rails_helper'

RSpec.describe Hospital, type: :model do
    subject { Hospital.new(name: "HospitalNameTest", location: "HospitalLocationTest", year: Date.new) }
    
    it "is valid with valid attributes" do 
        expect(subject).to be_valid
    end
    
    it "is not valid without the name attr" do
        subject.name = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without the location attr" do 
        subject.location = nil
        expect(subject).to_not be_valid
    end
    
    it "ist not valid without the year attr" do 
        subject.year = nil
        expect(subject).to_not be_valid
    end
    
end
