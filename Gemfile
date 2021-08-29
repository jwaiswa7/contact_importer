source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.0.4", ">= 6.0.4.1"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

gem "pagy", "~> 3.11" # A Scope & Engine based, clean, powerful, customizable and sophisticated paginator

gem "aasm" # aasm gem for state machine
gem "devise", "~> 4.7" # Flexible authentication solution for Rails
gem "has_defaults"

gem "aws-sdk-s3", "~> 1.14" # For aws s3 bucket
gem "bootstrap", "~> 4.5" # css bootstrap
gem "credit_card_validations" # credit card validation
gem "devise-bootstrapped", github: "excid3/devise-bootstrapped", branch: "bootstrap4"
gem "foreman"
gem "sidekiq", "~> 6.1.2" # Sidekiq is used to process background jobs with the help of Redis

gem "redis", "~> 4.2" # Redis ruby client
gem "redis-rails", "~> 5.0.2" # Redis for Ruby on Rails
gem "shrine", "~> 3.3" # Uploading, downloading, processing and deleting IO objects

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails", "~> 5.2" # factory_bot is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies
  gem "faker", "~> 2.11" # A library for generating fake data such as names, addresses, and phone numbers
  gem "rspec-rails", "~> 4.0" # rspec-rails is a testing framework for Rails 3+
  gem "rubocop", "~> 1.8", require: false # Automatic Ruby code style checking tool
  gem "rubocop-performance", "~> 1.9.2", require: false # A collection of RuboCop cops to check for performance optimizations in Ruby code
  gem "rubocop-rails", "~> 2.9.1", require: false # Automatic Rails code style checking tool
  gem "rubocop-rspec", "~> 2.1.0", require: false # Code style checking for RSpec files
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", "~> 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rspec-sidekiq" # sidekiq testing
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
