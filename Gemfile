# -*- coding: utf-8 -*-
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1'
# Uncomment this for Heroku
# gem 'rails_12factor'

gem 'quiet_assets'
gem 'thin'
# Admin Interface
gem 'rails_admin'

# Use SCSS for stylesheets
gem 'sass-rails', '=5.0.0.beta1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Needed for default layouts
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'underscore-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Adding Doorkeeper
gem 'doorkeeper'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'gmaps4rails'

gem 'geocoder'

gem 'devise', git: 'https://github.com/plataformatec/devise.git', :branch => 'lm-rails-4-2'
gem 'haml-rails'
gem 'cancan'

gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'resque-web', require: 'resque_web'
gem 'resque-scheduler'

group :production do
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end

gem 'therubyracer'
gem 'less-rails'

gem 'formtastic'
gem 'formtastic-bootstrap', github: 'siruguri/formtastic-bootstrap'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
end

#testing with rspec

group :test do
  gem 'shoulda-matchers'

  gem 'capybara'
  gem 'selenium-webdriver'
  gem "factory_girl_rails"
  gem 'database_cleaner'
  gem "email_spec"
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
end
