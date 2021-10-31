Rails.application.routes.draw do
  resources :direct_messages
  resources :users
  resources :content_creators
  resources :messages
  resources :reviews
  resources :referral_services
  resources :applications
  resources :collabs
  resources :campaigns
  resources :businesses
  resources :invitations
  resources :notifications
  # resources :sessions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # post '/login/' => 'sessions#create'
  # delete '/logout/' => 'sessions#destroy'
  # get '/me/' => 'users#show'

  #for deployment
  post "/login", to: "users#login"
  post "/logout", to: "users#logout"
  get "/me", to: "users#show"
end
