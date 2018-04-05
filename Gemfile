source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.4"
gem "puma", "~> 3.7"
gem "sass-rails",     "5.0.6"
gem "bootstrap-sass", "3.3.7"
gem "jquery-rails",   "4.3.1"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "toastr-rails"
gem "figaro"
gem "sidekiq"
gem "devise"
gem "delayed_job_active_record"
gem 'devise_zxcvbn' # password strength for devise
gem "rolify"
gem "cancancan"
gem 'catpants', '2.5.0' # password strength
gem 'jquery-turbolinks'
gem 'whenever', require: false
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
#gem 'ransack'

# gem 'sunspot_rails'
# gem 'sunspot_solr'
# gem 'progress_bar'

gem 'elasticsearch-model'
gem 'elasticsearch-rails'

gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

group :development, :test do
  gem "sqlite3", "1.3.13"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
