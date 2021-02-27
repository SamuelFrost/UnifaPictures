Rails.application.routes.draw do
  resources :pictures
  resources :sessions, only: [:new, :create]
  get "sessions/" => "sessions#new"
  delete "sessions/" => "sessions#destroy"

  root to: 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
