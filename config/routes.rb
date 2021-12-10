Rails.application.routes.draw do

  namespace :api do
    resources :tags, only: :index
  end

  # не обязателная локаль
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    # дергаем спец. девайзовский метод, который генерит все нужные ему пути
    devise_for :users
    root 'ads#index'

    resources :users
    resources :ads

    namespace :admin do
      resources :users, only: %i[index edit update destroy]
      resources :ads, only: %i[index edit update destroy]
    end

    delete 'attachments/:id/purge/', to: 'attachments#purge', as: 'purge_attachment'
  end
end
