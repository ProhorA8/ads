Rails.application.routes.draw do
  # не обязателная локаль
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    # дергаем спец. девайзовский метод, который генерит все нужные ему пути
    devise_for :users
    root 'ads#index'

    resources :users
    resources :tags, only: :index
    resources :ads

    namespace :admin do
      resources :users, only: :index
    end

    delete 'attachments/:id/purge/', to: 'attachments#purge', as: 'purge_attachment'
  end
end
