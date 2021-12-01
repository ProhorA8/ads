Rails.application.routes.draw do
  # дергаем спец. девайзовский метод, который генерит все нужные ему пути
  devise_for :users
  root 'ads#index'

  resources :users
  resources :tags, only: :index

  resources :ads do
    # Вложенные в ресурс объявления ресурсы фотографий
    resources :photos, only: [:create, :destroy]
  end
end
