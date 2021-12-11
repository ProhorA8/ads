class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # users/omniauth_callbacks#passthru
  # users/omniauth_callbacks#facebook
  # passthru – это действие создаться автоматически после наследования
  #
  # В этот метод придёт ответ от сервера со специальным токеном который будет использоваться
  def facebook
    # Дёргаем метод модели, который найдёт пользователя
    # request.env['omniauth.auth'] – передаст devise
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    # Если юзер есть, то логиним и редиректим на его страницу
    if @user.persisted?
      flash[:notice] = t('devise.omniauth_callbacks.success', kind: 'Facebook')
      # sign_in_and_redirect – предоставляет devise
      sign_in_and_redirect @user, event: :authentication
      # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = t(
        'devise.omniauth_callbacks.failure',
        kind: 'Facebook'
      )

      redirect_to root_path
    end
  end
end
