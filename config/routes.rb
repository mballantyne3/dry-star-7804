Rails.application.routes.draw do
  resources :doctor
  resources :doctor_patients
  resources :patient
  resources :hospital
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
