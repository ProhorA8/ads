Rails.application.routes.draw do
  # дергаем спец. девайзовский метод, который генерит все нужные ему пути
  devise_for :users
  root 'ads#index'

  resources :users
  resources :tags, only: :index
  resources :ads

  delete 'attachments/:id/purge/', to: 'attachments#purge', as: 'purge_attachment'
end
