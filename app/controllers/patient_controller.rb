class PatientController < ApplicationController
  def index
    @patients = Patient.over_18_by_name.all
  end
end
