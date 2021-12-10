# Рендерим роли для пользователя в админке
module Admin
  module UsersHelper
    def user_roles
      User.roles.keys.map do |role|
        # рендерим в селекте
        # [t(role, scope: 'global.user.roles'), ...] – название роли
        # [..., role] –  ключ соответствующий ключу в модели
        [t(role, scope: 'global.user.roles'), role]
      end
    end
  end
end
