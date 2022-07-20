source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.4"

gem "rails", "~> 6.1"
# gem "rack", ">= 2.0.8"
gem "rubyzip", ">= 1.3.0"
gem "pg"
gem "simpacker"
# gem "purecss-sass"
gem "kaminari"
gem "ransack"
gem "enum_help"
# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.7"
# Use paper_trail for versioning histories of records
gem "paper_trail"

# Magical Authentication for Rails
gem "sorcery"
gem "puma", "~> 5.6"


group :development, :test do
  gem "byebug"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  # Guard::RSpec allows to automatically & intelligently launch specs when files are modified
  # gem "guard-rspec"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false
  gem "dotenv-rails"
  gem "i18n-tasks"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  # gem "web-console", "~> 3.7.0"
  gem "listen"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen"
  # エラー画面をわかりやすく！
  gem "better_errors"
  gem "binding_of_caller"
  # N+1問題検知
  gem "bullet"

  # Use Capistrano for deployment
  gem "capistrano-rails"
  gem "capistrano-rbenv"
  gem "capistrano3-puma"
end

group :test do
  # RSpec and Minitest-compatible one-liners that test common Rails functionality
  gem "shoulda-matchers"
  # Adds support for Capybara system testing and selenium driver
  gem "capybara"
  # helper class for launching cross-platform applications in a fire and forget manner
  gem "launchy"
end
