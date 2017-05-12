require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"

    DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://database.db')
  end

  use Rack::Flash

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:id]) if session[:id]
    end

    def logged_in?
      !!current_user
    end
  end
end
