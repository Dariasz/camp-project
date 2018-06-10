source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'coffee-rails', '~> 4.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'

gem 'carrierwave'
gem 'carrierwave-google-storage'
gem 'cocoon'
gem 'devise'
gem 'figaro'
gem 'fog-aws'
gem 'font-awesome-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'simple-navigation'
gem 'simple_form'

gem 'fullcalendar-rails'
gem 'momentjs-rails'

gem 'cancancan'
gem 'draper'
gem 'page_title_helper'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'responder'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'capybara-selenium'
  gem 'factory_bot_rails'
  gem 'i18n-tasks', '~> 0.9.19'
  gem 'letter_opener'
  gem 'pry'
  gem 'pundit-matchers', '~> 1.4.1'
  gem 'rspec-rails', '~> 3.6'
  gem 'rubocop'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git'
end

group :development do
  gem 'compass-rails', '~> 3.0.2'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
