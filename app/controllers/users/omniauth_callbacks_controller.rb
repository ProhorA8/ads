module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # users/omniauth_callbacks#passthru – редирект пользователя, когда он захочет авторизоваться через соц. сеть
    # passthru – это действие создаться автоматически после наследования
    # users/omniauth_callbacks#facebook – приходит ответ от сервера для обработки

    def github
      handle_auth 'github'
    end

    def facebook
      handle_auth 'facebook'
    end

    def vkontakte
      handle_auth 'vkontakte'
    end

    # В этот метод придёт ответ от сервера со специальным токеном который будет использоваться
    def handle_auth(provider)
      # Дёргаем метод модели, который найдёт пользователя
      # request.env['omniauth.auth'] – передаст devise
      @user = User.find_for_oauth(request.env['omniauth.auth'])

      # Если юзер есть, то логиним и редиректим на его страницу
      if @user.persisted?
        flash[:notice] = t('devise.omniauth_callbacks.success', kind: provider)
        # sign_in_and_redirect – предоставляет devise
        sign_in_and_redirect @user, event: :authentication
        # Если неудачно, то выдаём ошибку и редиректим на главную
      else
        session['devise.auth_data'] = request.env['omniauth.auth'].except('extra')
        flash[:error] = t('devise.omniauth_callbacks.failure', kind: provider)

        redirect_to root_path
      end
    end
  end
end
