# Рендерим статусы для объявления в админке
module Admin
  module AdsHelper
    def ad_statuses
      Ad.statuses.keys.map do |status|
        # рендерим в селекте
        # [t(status, scope: 'global.ad.statuses'), ...] – название статуса
        # [..., status] –  ключ соответствующий ключу в модели
        [t(status, scope: 'global.ad.statuses'), status]
      end
    end
  end
end
