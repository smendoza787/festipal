ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require 'sinatra/base'
require 'rack-flash'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "db/#{ENV['SINATRA_ENV']}.postgresql"
)

require_all 'app'
