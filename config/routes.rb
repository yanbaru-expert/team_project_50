Rails.application.routes.draw 
  root 'texts#index'
  resources :texts, :only => [:index, :show]
  resources :movies, :only => [:index]
end
