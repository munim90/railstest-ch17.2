source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem "sass-rails", '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'mimemagic', '~> 0.3.10'
gem "minitest-sprint"
gem "minitest-bisect"
gem 'minitest-rails'
gem 'bootsnap', '>= 1.4.2', require: false
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "foreman"

gem "coffee-rails"
gem "devise"
gem "uglifier"

gem "capistrano-rails", group: :development

gem "awesome_print"
gem "twitter"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "capybara-screenshot"
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "mocha"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails"
  gem "rubocop"
  gem "selenium-webdriver"
end

group :development do
  gem "guard"
  gem "guard-cucumber"
  gem "guard-jasmine"
  gem "guard-minitest"
  gem "guard-rspec"
  gem "listen"
  gem "rb-readline"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "vcr"
  gem "webmock"
  gem "minitest-rails-capybara"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]