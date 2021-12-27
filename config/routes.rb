Rails.application.routes.draw do

  namespace :api do
    resources :tags, only: :index
  end

  # назначаем контроллер
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  # не обязателная локаль
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    # дергаем спец. девайзовский метод, который генерит все нужные ему пути
    devise_for :users, skip: :omniauth_callbacks
    root 'ads#index'
    resources :users
    resources :ads

    namespace :admin do
      resources :users, only: %i[index edit update destroy]
      resources :ads, only: %i[index edit update destroy]
      resources :tags
    end

    delete 'attachments/:id/purge/', to: 'attachments#purge', as: 'purge_attachment'
  end
end
