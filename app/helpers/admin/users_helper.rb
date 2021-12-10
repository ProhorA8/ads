# Рендерим роли для пользователя в админке
module Admin
  module UsersHelper
    def user_roles
      roles = ['Пользователь','Админ']
      roles.map do |role|
        [role]
      end
    end
  end
end
