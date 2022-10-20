source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'
gem 'devise'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
#gem 'sqlite3', '~> 1.4.4'
gem 'mysql2'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# gem 'bcrypt', '~> 3.1.7'
gem 'cancancan'
gem 'rails_admin', '~> 2.0.0.beta'
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"
gem 'kaminari'
gem 'ransack'
gem 'bootstrap', '~> 4.1.1'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'acts-as-taggable-on', '~> 8.0'
gem 'rails-i18n', '~> 6.0.0'
gem 'devise-i18n'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 5.0.3'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  #gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'unicorn', '5.4.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
