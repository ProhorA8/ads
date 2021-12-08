class ApplicationController < ActionController::Base
  # подключаем модули из concerns
  include ErrorHandling
  include Internationalization

  # Подключить функционал Пандита ко всем контроллерам
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Настройка для работы Девайза, когда юзер правит профиль
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?

  # Обработать ошибку авторизации
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Настройка для девайза — разрешаем обновлять профиль, но обрезаем
  # параметры, связанные со сменой пароля.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[password password_confirmation current_password]
    )
  end

  # Вспомогательный метод, возвращает true, если текущий залогиненный юзер
  # может править и удалять указанное объявление
  # Отключаем копа, проверяющего насколько информативны имена параметров метода
  # rubocop:disable Naming/MethodParameterName
  def current_user_can_edit?(ad)
    user_signed_in? && ad.user == current_user
  end
  # rubocop:enable all

  private

  # метод для pundit
  def user_not_authorized
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
