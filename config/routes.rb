Rails.application.routes.draw do
  resources :test_reports
  resources :rooms
  resources :prescriptions
  get "patient_dashboard/index"
  resources :appointments
  get "patients/index"
  get "patients/new"
  get "patients/edit"
  get "dashboard/index"
  get "auth/login"
  get "auth/signup"
  root "home#index"

  get "login", to: "auth#login"
  post "login", to: "auth#authenticate"
  delete "logout", to: "auth#logout"
  get "signup", to: "auth#signup"
  post "signup", to: "auth#create"
  get "/profile", to: "users#profile"

  get "/select-login-role", to: "auth#select_login_role"
  get "/select-signup-role", to: "auth#select_signup_role"

  get "dashboard", to: "dashboard#index"
  get "patient_dashboard",to: "patient_dashboard#index"
  get "/medical_history",
    to: "medical_records#history",
    as: :medical_history
  
  get "/doctor/medical_records",
    to: "medical_records#index",
    as: :doctor_medical_records

  get "/my_appointments",
    to: "appointments#patient_appointments",
    as: :patient_appointments
  get "/doctor_appointments",
    to: "appointments#doctor_appointments"

  resources :patients do
  collection do
    get :export
  end
end

resources :doctors do
  collection do
    get :export
  end
end

  resources :doctors, only: [:index, :show]
  
  resources :bills, only: [:index, :show]

  resources :medical_records
  
  resource :doctor_profile,
         only: [:show, :edit, :update]

         
end
