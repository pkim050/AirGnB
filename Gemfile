source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'materialize-sass'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'gravatar_image_tag', github: 'mdeering/gravatar_image_tag'
gem 'rack-cors'
gem 'devise'
gem 'omniauth'
gem 'omniauth-github'
gem 'dotenv-rails'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'active_model_serializers'
gem 'dotenv' #Shim to load environment variables from .env into ENV in development.
gem 'paperclip' #Easy upload management for ActiveRecord
gem 'jquery-ui-rails' #This gem packages the jQuery UI assets (JavaScripts, stylesheets, and images) for the Rails asset pipeline, so you never have to download a custom package through the web interface again.
gem 'bootstrap' #The most popular HTML, CSS, and JavaScript framework for developing responsive, mobile first projects on the web. http://getbootstrap.com
gem 'pickadate-rails'
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'jquery-turbolinks'
gem 'underscore-rails'
gem 'sdoc', group: :doc #rdoc generator html with javascript search index.
gem 'figaro' #Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem 'dropzonejs-rails' #DropzoneJS is an open source library that provides drag’n’drop file uploads with image previews
gem 'pundit' #Pundit provides a set of helpers which guide you in leveraging regular Ruby classes and object oriented design patterns to build a simple, robust and scaleable authorization system.
gem 'gmaps4rails' #Gmaps4rails is developed to simply create a Google Map with overlays (markers, infowindows...)
gem 'geocoder' #Provides object geocoding (by street or IP address), reverse geocoding (coordinates to street address), distance queries for ActiveRecord and Mongoid, result caching, and more.
gem 'markerclustererplus-rails' #MarkerClustererPlus is an enhanced Google Maps V3 implementation
gem 'sprockets' #Sprockets is a Ruby library for compiling and serving web assets. It features declarative dependency management for JavaScript and CSS assets, as well as a powerful preprocessor pipeline that allows you to write assets in languages like CoffeeScript, Sass and SCSS.
gem 'kaminari' #A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for modern web app frameworks and ORMs
gem 'bootstrap4-kaminari-views' #bootstrap for kaminari
gem 'pry'
gem 'mimemagic'
gem 'rails_12factor'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
