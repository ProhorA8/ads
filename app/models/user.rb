class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :database_authenticatable предполагает, что в БД есть информация о том, какой у пользователя password_hash.
  # :registerable означает, что Девайз берётся за управление вьюхами и контроллерами,
  # которые отвечают за регистрацию на сайте.
  # :rememberable запоминает пользователя даже после того, как тот закрыл браузер и вернулся через какое-то время.
  # :recoverable управляет вьюхами и контроллерами, если пользователь захотел восстановить доступ к аккаунту.
  # Сюда же входит функция отправки писем с ссылкой для восстановления пароля.
  # :confirmable требует, чтобы юзер подтвердил почту после регистрации.
  # :trackable хранит информацию в БД о последнем посещении, количестве заходов, ip пользователя.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ads, dependent: :destroy

  validates :username, presence: true, length: { maximum: 40 }

  before_validation :set_username, on: :create

  private

  # Задаем юзеру случайное имя потому что в форме devise это поле не отображается
  def set_username
    self.username = "Пользователь №#{rand(777)}" if name.blank?
  end
end
