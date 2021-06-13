Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "texts#index"
    devise_scope :user do
  post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :texts, only: [:index, :show]
  resources :movies, only: [:index] do 
    resource :watch_progresses, only: [:create, :destroy]
  end
end
