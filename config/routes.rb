Rails.application.routes.draw do


  resources :jobs
  resources :managers
  resources :employees
  resources :companies
  

  devise_for :users
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "test1/show"
  get "test1/profile"
  get "test1/jobs"
  get "test2/show"



  root to: "home#index"
end
