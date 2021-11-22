Rails.application.routes.draw do
  devise_for :users
  root 'ads#index'

  resources :users
  resources :ads
  resources :tags, param: :name, only: :show
end
