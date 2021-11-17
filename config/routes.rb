Rails.application.routes.draw do
  root 'ads#index'

  resources :users
  resources :ads
end
