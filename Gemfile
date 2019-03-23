source 'https://rubygems.org'
gem 'bcrypt'
gem 'pry'
gem 'faker'
gem 'font-awesome-rails'
gem 'will_paginate'
gem 'carrierwave'
gem 'carrierwave-video'
gem 'cloudinary'
gem 'mini_magick'
gem 'fog'
gem 'pundit'
gem 'paperclip'
gem 'stripe'
gem 'dotenv-rails', :groups => [:development, :test]
gem 'paperclip-ffmpeg'
gem 'paperclip-av-transcoder'
gem 'dotenv-rails', :require => 'dotenv/rails-now'
# gem 'acts-as-taggable-on'

gem "recaptcha", require: "recaptcha/rails"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
#Use foundation rails
gem 'foundation-rails'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'spring'
  gem 'rails-controller-testing'
end

group :development do
  gem 'guard'
  gem 'guard-minitest'
  gem 'guard-rails'
  gem 'guard-bundler'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :production do
	gem 'pg'
end
