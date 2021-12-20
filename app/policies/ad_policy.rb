class AdPolicy < ApplicationPolicy
  # все могут просматривать объявления
  def show?
    edit?
  end

  def edit?
    user_is_owner?(record)
  end

  def update?
    user_is_owner?(record) || user == 'admin'
  end

  # можно создать ссылку, если есть юзер (залогинен)
  def create?
    user.present?
  end

  # Смотреть, обновлять и удалять объявления могут только их владельцы
  # Админы также могут делать что угодно с любыми объявлениеми
  def destroy?
    update?
  end

  # Код в комм. выбирает из исходного скоупа только объявления, принадлежащие юзеру
  class Scope < Scope
    def resolve
      scope
      # if user.present?
      #   # Если пользователь — админ, показываем все объявления,
      #   # иначе только те, что создал сам юзер
      #   user.role == 'admin' ? scope.all : scope.where(user: user)
      # end
    end
  end

  private

  # Отключаем копа, проверяющего насколько информативны имена параметров метода
  # rubocop:disable Naming/MethodParameterName
  def user_is_owner?(ad)
    user.present? && (ad.try(:user) == user)
  end
  # rubocop:enable all
end
