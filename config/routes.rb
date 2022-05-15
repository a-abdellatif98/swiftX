# frozen_string_literal: true

Rails.application.routes.draw do
  scope "/my" do
    devise_for :users, controllers: { sessions: 'users/sessions' }
  end

  devise_scope :user do
    get '/my/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :jogging_times

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'jogging_times#index'
end
