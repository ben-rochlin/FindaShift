Rails.application.routes.draw do


  resources :jobs
  resources :managers
  resources :employees
  resources :companies
  resources :job_applications
  

  devise_for :users
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "test1/show"
  get "test1/profile"
  get "test1/jobs"
  get "test2/show"
  get "test2/listings", to: "test2#listings", as: "ownjobs"
  get "test2/view/:id", to: "test2#view", as: "viewlisting"



  root to: "home#index"
end
