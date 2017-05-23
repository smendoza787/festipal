require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  use Rack::Flash

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def profile_random_string
      arr = [
        "...looks like they have better things to do. :/",
        "...work or something, I hope.",
        "...you look like you need a music festival in your life.",
        "...do you know what it feeeeels like, loving someone that's in a rush to throw you away?",
        "...let's go to a festival!",
        "You need to get out more...I know, a festival!",
        "I know school is important but you should at least get a festival in or two...",
        "...nothing, yet!",
        "...school young man!",
        "A festival a day keeps the bad vibes at bay."
      ]

      arr[rand(0..arr.size-1)]
    end

    def random_bg_image_url
      arr = [
        "/images/festival1.jpeg",
        "/images/festival2.jpeg",
        "/images/festival3.jpeg",
        "/images/festival4.jpeg",
        "/images/festival5.jpg"
      ]

      arr[rand(0..arr.size-1)]
    end

  end
end
