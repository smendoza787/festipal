class FestivalsController < ApplicationController

  get '/festivals' do
    if !logged_in?
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    else
      erb :'/festivals/index'
    end
  end

  get '/festivals/new' do
    erb :'/festivals/new'
  end

  post '/festivals' do
    fest = Festival.new(params[:festival])

    if fest.save
      flash[:message] = "Successfully created festival."

      redirect '/festivals'
    else
      flash[:errors] = fest.errors.full_messages

      erb :'/festivals/new'
    end
  end

end
