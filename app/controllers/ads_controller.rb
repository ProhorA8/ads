class AdsController < ApplicationController
  # Задаем объект @ad для экшена show
  before_action :_ad, only: :show
  # Задаем объект @ad от текущего юзера для других действий
  before_action :set_current_user_ad, only: %i[edit update destroy]
  before_action :fetch_tags, only: %i[new edit]

  # Предохранитель от потери авторизации в нужных экшенах
  after_action :verify_authorized, except: %i[index show]
  # Предохранитель от неиспользования pundit scope в index экшене
  after_action :verify_policy_scoped, only: :index

  def index
    # @tags = Tag.with_ads

    @ads = policy_scope(Ad.all_by_tags(params[:tag_ids]))
    @tags = Tag.all

    # kaminari – .page(params[:page])
    @ads_page = policy_scope(Ad.order(created_at: :desc).page(params[:page]))
  end

  def show; end

  def new
    @ad = current_user.ads.build
    authorize @ad
  end

  def create
    @ad = current_user.ads.build(ad_params)
    authorize @ad

    if @ad.save

      redirect_to user_path(@ad.user), notice: I18n.t('controllers.ads.created')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    authorize @ad
  end

  def update
    authorize @ad

    if @ad.update(ad_params)
      redirect_to ad_path(@ad), notice: I18n.t('controllers.ads.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @ad

    user = @ad.user

    @ad.destroy
    redirect_to user_path(user), notice: I18n.t('controllers.ads.destroyed')
  end

  private

  def fetch_tags
    @tags = Tag.all
  end

  def _ad
    @ad ||= Ad.find(params[:id])
  end

  def set_current_user_ad
    @ad = current_user.ads.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:title, :body, :life_cycle, tag_ids: [])
  end
end
