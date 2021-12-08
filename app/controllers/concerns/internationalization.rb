module Internationalization
  extend ActiveSupport::Concern

  included do
    around_action :switch_locale

    private

    # передаём действие которое необходимо выполнить
    def switch_locale(&action)
      # берём локаль из параметров url, если её нет, то ставим локаль по умолчанию
      locale = locale_from_url || I18n.default_locale
      I18n.with_locale locale, &action
    end

    # метод проверяющий что мы поддерживаем выбранную локаль
    def locale_from_url
      # здесь локаль представлет строку
      locale = params[:locale]

      # каждую локаль приводим к строке для сравнения строк
      return locale if I18n.available_locales.map(&:to_s).include?(locale)

      nil
    end

    # сохроняем локаль между запросами, переопределив встроенный метод из рельс
    def default_url_options
      # по дефолту каждому url пристыковываем текущую локаль
      { locale: I18n.locale }
    end
  end
end
