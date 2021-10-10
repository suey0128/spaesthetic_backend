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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'https://spaesthetic.herokuapp.com/login/' => 'sessions#create'
  delete 'https://spaesthetic.herokuapp.com/logout/' => 'sessions#destroy'
  get 'https://spaesthetic.herokuapp.com/me/' => 'users#show'
end
