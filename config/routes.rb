Rails.application.routes.draw do
  devise_for :users
  resources :managers
  resources :employees
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "test1/show"
  get "test2/show"

  root to: "home#index"
end
