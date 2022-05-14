# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get "/login" => "devise/sessions#new"
    get "/register" => "devise/registrations#new"    
  end
  resources :users
  resources :jogging_times

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'jogging_times#index'
end
