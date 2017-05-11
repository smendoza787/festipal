class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/artists/index'
  end

  get '/artists/:id' do
    if logged_in?
      @artist = Artist.find_by(id: params[:id])

      if @artist
        erb :'/artists/show'
      else
        flash[:message] = "Festival does not exist."

        redirect '/artists'
      end


    else
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    end
  end

end
