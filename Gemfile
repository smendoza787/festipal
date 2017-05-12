# frozen_string_literal: true
source "https://rubygems.org"

# gem "rails"

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'rack-flash3'
gem "tux"

group :development do
  gem 'sqlite3', '1.3.13'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor'
end
