Rails.application.routes.draw do


  get 'messages/index'
  get 'conversations/index'
  resources :jobs
  resources :managers
  resources :employees
  resources :companies
  resources :job_applications

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  

  devise_for :users
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "test1/show"
  get "test1/profile"
  get "test1/jobs"
  get "test1/new"
  get "test2/show"
  get "test2/listings", to: "test2#listings", as: "ownjobs"
  get "test2/view/:id", to: "test2#view", as: "viewlisting"



  root to: "home#index"
end
