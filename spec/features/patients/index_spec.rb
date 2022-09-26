require 'rails_helper'

RSpec.describe 'patient index page' do
  before :each do
    @seattle_grace = Hospital.create!(name: "Seattle Grace")
    @melodyMD = @seattle_grace.doctors.create!(name: "Melody", specialty: "Surgery", university: "University of Southern California")
    @mary = @melodyMD.patients.create!(name: "Mary", age: 30)
    @gandalf = @melodyMD.patients.create!(name: "Ben", age: 187)
    @pippin = @melodyMD.patients.create!(name: "Pippin", age: 16)

    visit patient_index_path
  end

  it 'has an index page with all adult patients over 18 years old in alphabetical order' do
    first = find("#patient-#{@gandalf.id}")
    second = find("#patient-#{@mary.id}")

    expect(first).to appear_before(second)
    expect(page).to_not have_content(@pippin.name)
  end
end
