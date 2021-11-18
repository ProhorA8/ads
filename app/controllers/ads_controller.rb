class AdsController < ApplicationController
  # Задаем объект @ad для экшена show
  before_action :set_ad, only: [:show]
  # Задаем объект @ad от текущего юзера для других действий
  before_action :set_current_user_ad, only: %i[edit update destroy]

  def index
    @ads = Ad.all
  end

  def show; end

  def new
    @ad = current_user.ads.build
  end

  def create
    @ad = current_user.ads.build(ad_params)

    if @ad.save

      redirect_to user_path(@ad.user), notice: I18n.t('controllers.ads.created')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @ad.update(ad_params)
      redirect_to user_path(@ad.user), notice: I18n.t('controllers.ads.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    user = @ad.user

    @ad.destroy
    redirect_to user_path(user), notice: I18n.t('controllers.ads.destroyed')
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def set_current_user_ad
    @ad = current_user.ads.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:title, :body)
  end
end
