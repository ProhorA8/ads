module ApplicationHelper
  # Возвращает адерс рандомной фотки объявления, если есть хотя бы одна. Или ссылку
  # на дефолтную картинку, которая лежит в app/assets/images
  def ad_photo(ad)
    photos = ad.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('ad.jpg')
    end
  end

  # Аналогично ad_photo, только возвращает миниатюрную версию
  def ad_thumb(ad)
    photos = ad.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('ad.jpg')
    end
  end
end
