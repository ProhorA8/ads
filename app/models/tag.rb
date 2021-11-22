class Tag < ApplicationRecord
  TAG_REGEX = /#[[:alpha:]-]+/.freeze

  has_many :tag_ads
  # делегируем отношение
  has_many :ads, through: :tag_ads

  scope :with_ads, -> { joins(:ads).distinct }

  before_validation { name&.downcase! }

  validates :name, presence: true

  def to_param
    name
  end
end
