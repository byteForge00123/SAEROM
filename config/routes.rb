Rails.application.routes.draw do
  root "dashboard#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "dashboard", to: "dashboard#index"
  get "search", to: "search#index"
  get "settings", to: "settings#index"
  get "billing", to: "invoices#index"

  resources :patients do
    resources :medical_records, shallow: true
    resources :prescriptions, shallow: true
    resources :appointments, shallow: true
    resources :invoices, shallow: true
  end

  resources :appointments
  resources :doctors
  resources :medical_records
  resources :prescriptions
  resources :services
  resources :invoices
  resources :staffs
  resources :reports, only: %i[index]

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
