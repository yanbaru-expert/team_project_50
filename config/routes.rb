Rails.application.routes.draw do
  resources :texts, :only => [:index, :show]
  resources :movies, :only => [:index]
end
