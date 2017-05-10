class FestivalsController < ApplicationController

  get '/festivals' do
    if !logged_in?
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    else
      erb :'/festivals/index'
    end
  end

end
