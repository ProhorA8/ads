class UsersController < ApplicationController
  # Задаем объект @user для шаблонов и экшенов
  before_action :set_current_user, except: :show

  # Ставим предохранитель для действия show
  after_action :verify_authorized, only: :show

  def show
    @user = User.find(params[:id])
    @ads = @user.ads.order(created_at: :desc)
    authorize @user
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = I18n.t('controllers.users.updated')

      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    flash[:success] = I18n.t('controllers.users.destroyed')

    redirect_to users_url
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :username, :email)
  end
end
