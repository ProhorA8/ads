class AdsController < ApplicationController
  # Задаем объект @ad для экшена show
  before_action :_ad, only: :show
  # Задаем объект @ad от текущего юзера для других действий
  before_action :set_current_user_ad, only: %i[edit update destroy]

  # Предохранитель от потери авторизации в нужных экшенах
  after_action :verify_authorized, except: %i[index show]
  # Предохранитель от неиспользования pundit scope в index экшене
  after_action :verify_policy_scoped, only: :index

  def index
    @tags = Tag.with_ads #
    # kaminari – .page(params[:page])
    # @ads = Ad.order(created_at: :desc).page(params[:page])
    @ads = policy_scope(Ad.order(created_at: :desc).page(params[:page]))
  end

  def show
    # Pundit создает новый экземпляр AdPolicy.new(current_user, @ad)
    # и вызывает у него метод, аналогичный имени текущего экшена: show?
    # если метод политики вернет false — будет брошен эксепшен
    # и действие контроллера не продолжится
    # authorize @ad
  end

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
      redirect_to user_path(@ad.user), notice: I18n.t('controllers.ads.updated')
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

  def _ad
    @ad ||= Ad.find(params[:id])
  end

  def set_current_user_ad
    @ad = current_user.ads.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:title, :body, :life_cycle, :type_ad)
  end
end
