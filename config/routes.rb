Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  resources :headers, only: [:index, :show]
  resources :friendships, only: [:index, :show, :create]
end
