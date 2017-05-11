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
    if !logged_in?
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    else
      session[:artist_num] = 1

      erb :'/festivals/new'
    end
  end

  post '/festivals' do
    fest = Festival.new(params[:festival])

    if fest.save
      fest.created_by_user_id = current_user.id
      fest.save

      params[:new_artist].each do |artist_params|
        if artist_params[:name] != "" && artist_params[:genre] != ""
          new_artist = fest.artists.find_or_create_by(artist_params)

          if !new_artist.save
            flash[:error] = fest.errors.full_messages

            redirect '/festivals/new'
          end
        end
      end

      flash[:message] = "Successfully created festival."

      redirect "/festivals/#{fest.id}"
    else
      flash[:error] = fest.errors.full_messages

      redirect '/festivals/new'
    end
  end

  get '/festivals/:id' do
    if logged_in?
      @festival = Festival.find_by(id: params[:id])

      if @festival
        erb :'/festivals/show'
      else
        flash[:message] = "Festival does not exist."

        redirect '/festivals'
      end

    else
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    end
  end

  get '/festivals/:id/edit' do
    if logged_in?
      @festival = Festival.find_by(id: params[:id])

      if @festival
        erb :'/festivals/edit'
      else
        flash[:message] = "Festival does not exist."

        redirect '/festivals'
      end

    else
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    end
  end

  get '/festivals/:id/add' do
    if logged_in?
      @festival = Festival.find_by(params[:id])

      if @festival
        current_user.festivals << @festival

        flash[:message] = "You're going to #{@festival.name}!"

        redirect "/festivals/#{@festival.id}"
      else
        flash[:message] = "Festival does not exist."

        redirect '/festivals'
      end

    else
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    end
  end

  get '/festivals/:id/remove' do

  end

  patch '/festivals/:id' do
    @festival = Festival.find_by(id: params[:id])
    @festival.update(params[:festival])

    flash[:message] = "Successfully updated festival."

    redirect "/festivals/#{@festival.id}"
  end

  delete '/festivals/:id' do
    @festival = Festival.find_by(id: params[:id])
    @festival.delete

    flash[:message] = "Successfully deleted festival."
    redirect '/festivals'
  end

end
