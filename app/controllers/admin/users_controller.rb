class Admin::UsersController < ApplicationController
  def index
    @users = User.all.order(name: :desc)
  end
end
