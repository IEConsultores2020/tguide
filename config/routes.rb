# frozen_string_literal: true

Rails.application.routes.draw do
  resources :people do
    resources :tracks
  end

  resources :tracks do
    collection do
      get 'find'
    end
  end

  resources :branches  do
    resources :people
  end
  resources :companies
  get 'pages/home'
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'site', to: 'site#index'

  root 'pages#home'
  #root "site#index"
end
