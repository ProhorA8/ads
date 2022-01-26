module Admin
  class TagsController < ApplicationController
    # Задаем объект @tag для шаблонов и экшенов
    before_action :set_tag!, only: %i[edit update destroy]

    def index
      @tags = Tag.all
    end

    def create
      @tag = Tag.new(tag_params)

      if @tag.save
        flash[:success] = t('controllers.tags.created')

        redirect_to admin_tags_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @tag.update(tag_params)
        flash[:success] = t('controllers.tags.updated')

        redirect_to admin_tags_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @tag.destroy
      flash[:success] = t('controllers.tags.destroyed')

      redirect_to admin_tags_path
    end

    private

    def set_tag!
      @tag = Tag.find params[:id]
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
  end
end
