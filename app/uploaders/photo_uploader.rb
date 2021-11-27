class PhotoUploader < CarrierWave::Uploader::Base
  # Добавляем обработчик, чтобы можно было менять размер фотографий и делать миниатюрные версии
  include CarrierWave::RMagick

  # Если мы работаем в локальной версии нашего приложения,
  # фотографии хранятся прямо в файловой системе, иначе используем fog
  # для загрузки их на Amazon S3
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Будут храниться все наши загруженные файлы uploas/photo/photo/1
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Обрезать/уменьшить фотографию так, чтобы получился квадрат 800x800
  process resize_to_fit: [800, 800]

  # Делаем миниатюрную версию 100x100
  version :thumb do
    process resize_to_fit: [100, 100]
  end

  # Разрешаем для загрузки только файлы с расширением картинок
  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
