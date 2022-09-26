require 'rails_helper'

RSpec.describe 'doctors show page' do
  before :each do
    @seattle_grace = Hospital.create!(name: "Seattle Grace")
    @melodyMD = @seattle_grace.doctors.create!(name: "Melody", specialty: "Surgery", university: "University of Southern California")
    @mary = @melodyMD.patients.create!(name: "Mary", age: 30)

    visit "/doctor/#{@melodyMD.id}"
  end

  it 'has a show page with doctors name, specialty, and university attended' do
    expect(page).to have_content("Welcome #{@melodyMD.name}")
    expect(page).to have_content("Specialty: Surgery")
    expect(page).to have_content("University Attended: University of Southern California")
  end
end
