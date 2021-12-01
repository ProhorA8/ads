class Tag < ApplicationRecord
  has_many :tag_ads, dependent: :destroy
  # делегируем отношение
  has_many :ads, through: :tag_ads
end
