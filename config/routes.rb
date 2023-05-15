Rails.application.routes.draw do
  devise_for :users
  get "hospitals", to: "hospitals#index"    
  get "hospitals/:id", to: "hospitals#detailed"
  post "hospitals", to: "hospitals#search"
  
  get 'download/hospitals/pdf/:id', to: "hospitals#pdf", as: "hospitals_pdf"
  
  root "root#index"
end
