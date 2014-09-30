source 'https://rubygems.org'

gem 'rails', '4.1.6'
gem 'sqlite3'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer',  platforms: :ruby
gem 'coffee-script', '~> 2.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'devise', '~> 3.3.0'
gem 'sidekiq', '~> 3.2.4'
gem 'unicorn', '~> 4.8.3'

gem "less-rails"
gem "twitter-bootstrap-rails"

group :development, :test do 
  gem 'spring'
  gem 'pry'
  gem 'binding_of_caller'
  gem 'better_errors'

  gem "guard"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-spring"
  gem 'spring-commands-rspec'
  gem "rb-inotify", require: false
  gem "rb-fsevent", require: false
  gem "rb-fchange", require: false
end

# Comment if you're not deploying this on heroku
group :production do
  gem 'rails_12factor'
end
