Rails.application.routes.draw do
  get "hospitals", to: "hospitals#index"    
  get "hospitals/:id", to: "hospitals#detailed"
  root "root#index"
end
