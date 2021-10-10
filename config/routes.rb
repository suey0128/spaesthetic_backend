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

  post '/login/' => 'https://spaesthetic.herokuapp.com/sessions#create'
  delete '/logout/' => 'https://spaesthetic.herokuapp.com/sessions#destroy'
  get '/me/' => 'https://spaesthetic.herokuapp.com/users#show'
end
