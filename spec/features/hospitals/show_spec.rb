require 'rails_helper'

RSpec.describe 'hospital show page' do
  before :each do
    @seattle_grace = Hospital.create!(name: "Seattle Grace")
    @melodyMD = @seattle_grace.doctors.create!(name: "Melody", specialty: "Surgery", university: "University of Southern California")
    @derekMD = @seattle_grace.doctors.create!(name: "Derek", specialty: "Orthopedics", university: "Johns Hopkins University")
    @mary = @melodyMD.patients.create!(name: "Mary", age: 30)
    @gandalf = @melodyMD.patients.create!(name: "Ben", age: 187)
    @pippin = @derekMD.patients.create!(name: "Pippin", age: 16)

    visit "/hospital/#{@seattle_grace.id}"
  end

  it 'has a show page that displays the hospital name and doctors that work at this hospital' do
    expect(page).to have_content("Welcome to Seattle Grace")

    within("#doctors-#{@melodyMD.id}") do
      expect(page).to have_content(@melodyMD.name)
    end
    within("#doctors-#{@derekMD.id}") do
      expect(page).to have_content(@derekMD.name)
    end
  end
end
