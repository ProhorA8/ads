module ErrorHandling
  extend ActiveSupport::Concern

  included do
    # Обработать ошибку не существующего объявления по id
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    # Метод для обработки не существующего объявления
    def notfound(exception)
      # пишем ошибку в журнал
      logger.warn exception
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
