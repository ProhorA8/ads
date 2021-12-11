class User < ApplicationRecord
  # _suffix: :role – добавляет суффикс, если user.role = 'admin', то user.admin_role? вернёт true
  enum role: { user: 'user', admin: 'admin' }, _suffix: :role

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
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :ads, dependent: :destroy

  validates :username, presence: true, length: { maximum: 40 }

  before_validation :set_username, on: :create

  private

  # Задаем юзеру случайное имя потому что в форме devise это поле не отображается
  def set_username
    self.username = "Пользователь №#{rand(777)}" if name.blank?
  end

  # метод facebook
  def self.find_for_facebook_oauth(access_token)
    # получаем email
    email = access_token.info.email
    # поиск в базе по email пользователя
    user = where(email: email).first

    # возвращаем её из метода, если она нашлась, если нет идём дальше
    return user if user.present?

    # палучаем провайдер
    provider = access_token.provider
    # получаем id
    id = access_token.extra.raw_info.id
    # формируем url пользователя
    url = "https://facebook.com/#{id}"

    # first_or_create! – вернёт найденную запись по условию,
    # если запись не нашлась, то создаётся новая и передаётся в блок
    where(url: url, provider: provider).first_or_create! do |user|
      # прописывается email
      user.email = email
      # генерим зашифрованный пароль
      user.password = Devise.friendly_token.first(16)
    end
  end
end
