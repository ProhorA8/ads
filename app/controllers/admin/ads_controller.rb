module Admin
  class AdsController < ApplicationController
    # Задаем объект @ad для шаблонов и экшенов
    before_action :set_ad!, only: %i[edit update destroy]

    def index
      @ads = Ad.all.order(created_at: :desc)
    end

    def edit; end

    def update
      if @ad.update(ad_params)
        flash[:success] = t('controllers.ads.updated')

        redirect_to admin_ads_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @ad.destroy
      flash[:success] = t('controllers.ads.destroyed')

      redirect_to admin_ads_path
    end

    private

    def set_ad!
      @ad = Ad.find params[:id]
    end

    def ad_params
      params.require(:ad).permit(:status, :all_tags, tag_ids: [])
    end
  end
end
