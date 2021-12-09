module Api
  class TagsController < ApplicationController
    # возвращает JSON
    def index
      # AREL – для написание сложного SQL запроса на Ruby
      tags = Tag.arel_table
      # все теги заголовки которых содержат введённное слово
      # "%#{params[:term]}%" – найти заголовок в котором содержится слово
      @tags = Tag.where(tags[:name].matches("%#{params[:term]}%"))

      # ответ
      respond_to do |format|
        format.json
      end
    end
  end
end
