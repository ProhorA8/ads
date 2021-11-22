class TagAd < ApplicationRecord
  belongs_to :tag
  belongs_to :ad
end
