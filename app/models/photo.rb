class Photo < ApplicationRecord
  # Фотография оставлена к какому-то объявлению
  belongs_to :ad
  # Фотографию добавил какой-то пользователь
  belongs_to :user

  # У фотографии всегда есть объявление и пользователь
  validates :ad, :user, presence: true

  # Добавляем аплоадер фотографий, чтобы заработал carrierwave
  mount_uploader :photo, PhotoUploader
end
