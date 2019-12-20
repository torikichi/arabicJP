source 'https://rubygems.org'
ruby '2.4.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
gem 'rack', '>= 2.0.8'
gem 'rubyzip', '>= 1.3.0'
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'purecss-sass'
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use kaminari pagenation
gem 'kaminari'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use paper_trail for versioning histories of records
gem 'paper_trail'

# Magical Authentication for Rails
gem 'sorcery'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'puma'

gem 'listen'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Testing flamework
  gem 'rspec-rails'
  # A library for setting up Ruby objects as test data
  gem 'factory_bot_rails'
  # Guard::RSpec allows to automatically & intelligently launch specs when files are modified
  gem 'guard-rspec'
  # Implements the RSpec command for Spring
  gem 'spring-commands-rspec'
end

group :production do
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.7.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # エラー画面をわかりやすく！
  gem 'better_errors'
  gem 'binding_of_caller'

  # N+1問題検知
  gem 'bullet'

  # Use Capistrano for deployment
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
end

group :test do
  # helper class for launching cross-platform applications in a fire and forget manner
  gem "launchy"
  # RSpec and Minitest-compatible one-liners that test common Rails functionality
  gem "shoulda-matchers"
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'webdrivers'
end