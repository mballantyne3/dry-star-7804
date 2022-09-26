require 'rails_helper'

RSpec.describe 'doctors show page' do
  before :each do
    @seattle_grace = Hospital.create!(name: "Seattle Grace")
    @melodyMD = @seattle_grace.doctors.create!(name: "Melody", specialty: "Surgery", university: "University of Southern California")
    @mary = @melodyMD.patients.create!(name: "Mary", age: 30)
    @mackinley = @melodyMD.patients.create!(name: "MacKinley", age: 30)

    visit "/doctor/#{@melodyMD.id}"
  end

  it 'has a show page with doctors name, specialty, and university attended' do
    expect(page).to have_content("Welcome #{@melodyMD.name}")
    expect(page).to have_content("Specialty: Surgery")
    expect(page).to have_content("University Attended: University of Southern California")
  end

  it 'shows the name of the hospital where this doctor works' do
    expect(page).to have_content("Hospital Currently Employed At: Seattle Grace")
  end

  it 'shows a list of all patients assigned to this doctor' do
    within("#patient-#{@mary.id}") do
      expect(page).to have_content("#{@mary.name}")
    end
    within("#patient-#{@mackinley.id}") do
      expect(page).to have_content("#{@mackinley.name}")
    end
  end

  it 'can remove a patient from a doctor' do
    within("#patient-#{@mary.id}") do
      click_button('Delete Patient')
      expect(current_path).to eq("/doctor/#{@melodyMD.id}")
    end
  end
end
