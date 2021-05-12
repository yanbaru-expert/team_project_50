Rails.application.routes.draw do
  devise_for :texts
  root "texts#index"
  resources :texts, only: [:index, :show]
  resources :movies, only: [:index]
end
