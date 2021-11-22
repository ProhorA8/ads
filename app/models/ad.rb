class Ad < ApplicationRecord
  belongs_to :user

  has_many :photos, dependent: :destroy
  has_many :tag_ads, dependent: :destroy
  has_many :tags, through: :tag_ads

  validates :title, :body, :life_cycle, :type_ad, presence: true

  after_commit :update_tags, on: %i[create update]

  private

  def update_tags
    tag_ads.clear # чистим связи
    "#{type_ad}".downcase.scan(Tag::TAG_REGEX).uniq.each do |tag|
      tags << Tag.find_or_create_by(name: tag.delete('#'))
    end
  end
end
