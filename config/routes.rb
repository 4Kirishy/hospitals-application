Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "hospitals", to: "hospitals#index"    
  
  get "hospitals/export.csv", to: "hospitals#export_csv"
  get "hospitals/:id", to: "hospitals#detailed"
  post "hospitals", to: "hospitals#search"
  
  get 'download/hospitals/pdf/:id', to: "hospitals#pdf", as: "hospitals_pdf"
  
  root "root#index"
end
