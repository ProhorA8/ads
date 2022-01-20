source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# Уменьшает время загрузки за счет кэширования, требуется в config/boot.rb
gem 'bootsnap', require: false
# Гем для загрузки картинок
gem 'carrierwave'
# Аутентификации для Rails, основанное на Warden
gem 'devise'
# Для перевода сообщений девайса
gem 'devise-i18n'
# Решение для интернационализации и локализации Ruby
gem 'i18n'
# Помошник по обработке изображений
gem 'image_processing'
# Предоставляет DSL для объявления структур JSON
gem 'jbuilder'
# Помощник нумерации страниц
gem 'kaminari'
# Для работы carrierwave с хранилищем Amazon S3
gem 'fog-aws'
gem 'aws-sdk-s3', require: false
# Предоставляет набор помощников для авторизации
gem 'pundit'
# Шаблонизатор для HTML
gem 'haml'
# Обеспечивает защиту от CVE-2015-9284, реализации верификатора токена CSRF
gem 'omniauth-rails_csrf_protection'
# Аутентификация для facebook
gem 'omniauth-facebook'
# Аутентификация для vkontakte
gem 'omniauth-vkontakte'
# Аутентификация для github
gem 'omniauth-github'
# Используйте Puma в качестве сервера приложений
gem 'puma'
# Среда веб-приложения
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Централизация сбора данных о локали
gem 'rails-i18n'
# Гем для обработки картинок
gem 'rmagick'
# Windows не включает файлы zoneinfo, поэтому свяжите гем tzinfo-data
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Упрощает использование препроцессора JavaScript и сборщика Webpack v5
gem 'webpacker'

group :development, :test do
  # Вызовите "byebug" в любом месте кода, чтобы остановить выполнение и получить консоль отладчика.
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Для создания снимков экрана, получения реальных тестовых данных и заполнения вашей базы данных
  gem 'faker'
  # Для создания тестовых данных
  gem 'factory_bot_rails'
  # Консоль разработчика среды выполнения
  gem 'pry'
  # Среда тестирования
  gem 'rspec'
  gem 'rspec-rails'
  # Статический анализатор кода Ruby
  gem 'rubocop'
  # Ускоряет написание тестов
  gem 'shoulda-matchers'
  # Используйте sqlite3 в качестве базы данных для Active Record
  gem 'sqlite3'
end

group :development do
  # Адаптеры для MRI, оптимизированные для ОС
  gem 'listen'
  # Доступ к интерактивной консоли на страницах исключений или вызов 'console' в любом месте кода.
  gem 'web-console'
end

group :production do
  # Ruby-интерфейс к СУБД PostgreSQL
  gem 'pg'
end
