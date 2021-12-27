module AdsHelper
  # метод для перевода статуса объявления
  def translation_status(status)
    t(status, scope: 'global.ad.statuses')
  end
end
