Rails.application.routes.draw do
  resources :pictures
  post "pictures/unifa_tweet" => "pictures/unifa_tweet"

  resources :sessions, only: [:new, :create]
  get "sessions/" => "sessions#new"
  delete "sessions/" => "sessions#destroy"

  resources :oauth, only: [:index]
  get "oauth/request_authorization_redirect" => "oauth#request_authorization_redirect"
  get "oauth/callback" => "oauth#callback"


  root to: 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
