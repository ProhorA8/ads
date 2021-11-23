class Photo < ApplicationRecord
  # Фотография оставлена к какому-то объявлению
  belongs_to :ad
  # Фотографию добавил какой-то пользователь
  belongs_to :user

  # У фотографии всегда есть объявление и пользователь
  validates :ad, presence: true
  validates :user, presence: true

  # Добавляем аплоадер фотографий, чтобы заработал carrierwave
  mount_uploader :photo, PhotoUploader

  # Этот scope нужен нам, чтобы отделить реальные фотки от болваной
  # Если мы вызовем persisted, то достаём из базы те фото у которых id не пустой
  # см. ads_controller
  scope :persisted, -> { where "id IS NOT NULL" }
end
