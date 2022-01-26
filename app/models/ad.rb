class Ad < ApplicationRecord
  # _suffix: :status – добавляет суффикс, если ad.status = 'approved', то ad.approved_status? вернёт true
  enum status: { in_progress: 'in progress', approved: 'approved', rejected: 'rejected' }, _suffix: :status

  belongs_to :user

  has_many :tag_ads, dependent: :destroy
  has_many :tags, through: :tag_ads
  has_many_attached :images

  validates :title, :body, :images, presence: true

  # scope :all_by_tags = def self.all_by_tags
  scope :all_by_tags, lambda { |tags|
    ads = includes(:user)
    # если tag_ids не nil
    ads = if tags
            ads.joins(:tags).distinct.where(tags: tags).preload(:tags)
          else
            ads.includes(:tag_ads, :tags)
          end

    ads.reverse_order
  }
end
