# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope '/my' do
      devise_for :users, controllers: { sessions: 'users/sessions' }
      resource :user, only: %i[show update]
    end
  end

  devise_scope :user do
    get '/my/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :jogging_times

  get '/jogging_times/avrege' => 'jogging_times#avrege'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'jogging_times#index'
end
