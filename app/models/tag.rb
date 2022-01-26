class Tag < ApplicationRecord
  has_many :tag_ads, dependent: :destroy
  # делегируем отношение через таблицу tag_ads
  has_many :ads, through: :tag_ads

  validates :name, presence: true, uniqueness: true

  # перед валидацией приводим тег в нижний регистр
  before_validation { name&.downcase! }
end
