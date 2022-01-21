module Admin
  class UsersController < ApplicationController
    # Задаем объект @user для шаблонов и экшенов
    before_action :set_user!, only: %i[edit update destroy]

    def index
      @users = User.all.order(name: :desc)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        flash[:success] = t('controllers.admin.users.created')
        redirect_to admin_users_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @user.update(user_params)
        flash[:success] = t('controllers.admin.users.updated')

        redirect_to admin_users_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      flash[:success] = t('controllers.admin.users.destroyed')

      redirect_to admin_users_path
    end

    private

    def set_user!
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation, :role)
    end
  end
end
