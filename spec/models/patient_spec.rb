require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctors}

  describe "alphabetical_patients" do
    before :each do
      @seattle_grace = Hospital.create!(name: "Seattle Grace")
      @melodyMD = @seattle_grace.doctors.create!(name: "Melody", specialty: "Surgery", university: "University of Southern California")
      @mary = @melodyMD.patients.create!(name: "Mary", age: 30)
      @gandalf = @melodyMD.patients.create!(name: "Ben", age: 187)
      @pippin = @melodyMD.patients.create!(name: "Pippin", age: 16)
    end

    it 'lists patients over the age of 18 in alphabetical order' do
      expect(Patient.over_18_by_name).to eq([@gandalf, @mary])
    end
  end
end
