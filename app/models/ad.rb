class Ad < ApplicationRecord
  belongs_to :user

  has_many :photos, dependent: :destroy
  has_many :tag_ads, dependent: :destroy
  has_many :tags, through: :tag_ads
  has_many_attached :images

  validates :title, :body, :life_cycle, presence: true

  # scope :all_by_tags = def self.all_by_tags
  scope :all_by_tags, ->(tags) do
    ads = includes(:user)
    # если tag_ids не nil
    if tags
      ads = ads.joins(:tags).where(tags: tags).preload(:tags)
    else
      ads = ads.includes(:tag_ads, :tags)
    end

    ads.order(created_at: :desc)
  end
end
