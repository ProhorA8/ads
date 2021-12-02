source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# Гем для загрузки картинок
gem 'carrierwave'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Аутентификации для Rails, основанное на Warden
gem 'devise'
# Гем для перевода сообщений девайса
gem 'devise-i18n'
# Решение для интернационализации и локализации Ruby
gem 'i18n'
# Помощников по обработке изображений
gem "image_processing"
# Помощник нумерации страниц
gem 'kaminari'
# Для создания снимков экрана, получения реальных тестовых данных и заполнения вашей базы данных
gem 'faker'
# Гем для работы carrierwave с хранилищем Amazon S3
gem 'fog-aws'
# Предоставляет набор помощников для авторизации
gem 'pundit'
# Шаблонизатор для HTML
gem 'haml'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Предоставляет jQuery и драйвер jQuery-ujs
gem 'jquery-rails'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.6'
gem 'rails-i18n'
# Гем для обработки картинок
gem 'rmagick'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Подключаем Bootstrap
gem 'twitter-bootstrap-rails'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
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
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'pg'
end
