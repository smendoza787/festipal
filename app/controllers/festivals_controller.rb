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
    if logged_in?
      erb :'/festivals/new'
    else
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    end
  end

  post '/festivals' do
    fest = Festival.new(params[:festival])

    if fest.save
      fest.created_by_user_id = current_user.id
      fest.save
      flash[:message] = "Successfully created festival."

      redirect "/festivals/#{fest.id}"
    else
      flash[:error] = fest.errors.full_messages

      redirect '/festivals/new'
    end
  end

  get '/festivals/:id' do
    if logged_in?
      @festival = Festival.find(params[:id])

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
      @festival = Festival.find(params[:id])

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

  patch '/festivals/:id' do
    @festival = Festival.find(params[:id])
    @festival.update(params[:festival])

    flash[:message] = "Successfully updated festival."

    redirect "/festivals/#{@festival.id}"
  end

  delete '/festivals/:id' do
    @festival = Festival.find(params[:id])
    @festival.delete

    flash[:message] = "Successfully deleted festival."
    redirect '/festivals'
  end

end
