class UserPolicy < ApplicationPolicy
  # Смотреть юзера может, если юзер присутствует, он сам или админ
  def show?
    user.present? && (user == record || admin?(record) || user?(record))
  end

  def admin_forbidden?
    !admin?(record)
  end

  private

  def admin?(user)
    user.role == 'admin'
  end

  def user?(user)
    user.role == 'user'
  end
end
