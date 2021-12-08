module Admin
  class UsersController < ApplicationController
    def index
      @users = User.all.order(name: :desc)
    end
  end
end
