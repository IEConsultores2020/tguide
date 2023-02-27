Rails.application.routes.draw do
  
  resources :people do
    resources :tracks
  end
  
  resources :tracks 

  resources :branches
  resources :companies
  get 'pages/home'
  #devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
