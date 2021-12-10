# Рендерим статусы для объявления в админке
module Admin
  module AdsHelper
    def ad_statuses
      statuses = ['Подтверждена','Отклонена']
      statuses.map do |status|
        [status]
      end
    end
  end
end
