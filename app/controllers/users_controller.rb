class UsersController < ApplicationController
  # Встроенный в девайз фильтр - посылает незалогиненного пользователя
  before_action :authenticate_user!, except: :show
  # Задаем объект @user для шаблонов и экшенов
  before_action :set_current_user, except: :show

  # Ставим предохранитель для действия show
  after_action :verify_authorized, only: :show

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit; end

  def update
    if @user.update(user_params)

      redirect_to @user, notice: I18n.t('controllers.users.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url, notice: I18n.t('controllers.users.destroyed')
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :role)
  end
end
