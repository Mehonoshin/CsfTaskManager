source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'json'
gem 'heroku'

gem "devise"

group :production do
	gem 'pg'
	gem 'therubyracer-heroku'
end

gem "rails-backbone"
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem "haml"
gem 'twitter-bootstrap-rails', :git => "git://github.com/seyhunak/twitter-bootstrap-rails.git", :branch => "static"
gem 'jquery-rails'

group :development do
  gem 'hirb'
	gem 'mysql2'
  gem 'capistrano'
	gem 'growl_notify'
	gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
	gem 'guard-annotate'
end

group :test, :development do
  gem 'jasmine'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'mocha'
end