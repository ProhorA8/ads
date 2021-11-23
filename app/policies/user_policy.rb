class UserPolicy < ApplicationPolicy
  # Смотреть юзера может только он сам или админ
  def show?
    user.present? && (user == record || user.role == 'admin' || user.role == 'user')
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
