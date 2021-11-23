class PhotosController < ApplicationController
  # Для каждого действия нужно получить объявление, к которому привязана фотография
  before_action :set_ad, only: [:create, :destroy]

  # Для действия destroy нужно получить из базы саму фотографию
  before_action :set_photo, only: [:destroy]

  # Действие для создания новой фотографии
  # Фотку может сейчас добавить даже неавторизованный пользовать
  def create
    # Создаем новую фотографию у нужного события @ad
    @new_photo = @ad.photos.build(photo_params)

    # Проставляем у фотографии пользователя
    @new_photo.user = current_user

    if @new_photo.save
      # Если фотографию удалось сохранить, редирект на объявления с сообщением
      redirect_to @ad, notice: I18n.t('controllers.photos.created')
    else
      # Если фотографию не удалось сохранить, рендер объявления с ошибкой
      render 'ads/show', alert: I18n.t('controllers.photos.error')
    end
  end

  # Действие для удаления фотографии
  def destroy
    message = {notice: I18n.t('controllers.photos.destroyed')}

    # Проверяем, может ли пользователь удалить фотографию
    # Если может — удаляем, нет, меняем сообщение
    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      message = {alert: I18n.t('controllers.photos.error')}
    end

    # И в любом случае редиректим его на объявление
    redirect_to @ad, message
  end

  private
  # Так как фотография — вложенный ресурс, то в params[:ad_id] рельсы
  # автоматически положает id объявления, которому принадлежит фотография
  # найденное объявление будет лежать в переменной контроллера @ad
  def set_ad
    @ad = Ad.find(params[:ad_id])
  end

  # Получаем фотографию из базы стандартным методом find
  def set_photo
    @photo = @ad.photos.find(params[:id])
  end

  # При создании новой фотографии мы получаем массив параметров photo
  # c единственным полем (оно тоже называется photo)
  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end
end
