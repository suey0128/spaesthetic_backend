Rails.application.routes.draw do
  resources :content_creators
  resources :messages
  resources :reviews
  resources :referral_services
  resources :applications
  resources :collabs
  resources :campaigns
  resources :businesses
  resources :invitations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
