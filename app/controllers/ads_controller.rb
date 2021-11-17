class AdsController < ApplicationController
  before_action :set_ad, only: %i[show edit update destroy]

  def index
    @ads = Ad.all
  end

  def show
    @user_ad = @ad.user
  end

  def create
    @ad = Ad.new(ad_params)

    if @ad.save

      redirect_to user_path(@ad.user)
    else
      render :edit
    end
  end

  def edit; end

  def update
    if @ad.update(ad_params)
      redirect_to user_path(@ad.user), notice: 'Объявление обновлено'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    user = @ad.user

    @ad.destroy
    redirect_to user_path(user), notice: 'Объявление удалено'
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:title, :user_id)
  end
end
