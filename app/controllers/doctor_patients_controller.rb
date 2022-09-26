class DoctorPatientsController < ApplicationController
  def destroy
    patient = DoctorPatient.find_by(patient_id: params[:id], doctor_id: params[:doctor_id])
    patient.destroy!
    redirect_to "/doctor/#{params[:doctor_id]}"
  end
end
