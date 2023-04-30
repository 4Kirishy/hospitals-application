Rails.application.routes.draw do
  devise_for :users
  get "hospitals", to: "hospitals#index"    
  get "hospitals/:id", to: "hospitals#detailed"
  post "hospitals", to: "hospitals#search"
  root "root#index"
end
