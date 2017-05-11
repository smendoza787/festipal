class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if !logged_in?
      erb :'/users/new'
    else
      flash[:message] = "You're already logged in."

      redirect '/festivals'
    end
  end

  post '/signup' do
    @user = User.create(params)

    if !@user.save
      flash[:error] = @user.errors.full_messages

      redirect '/signup'
    else
      session[:id] = @user.id
      session[:message] = "Successfully created new account, thanks #{@user.username}!"

      redirect '/festivals'
    end

  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      flash[:message] = "You are already logged in as #{current_user.username}."

      redirect '/festivals'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id

      session[:message] = "Successfully logged in as #{@user.username}."

      redirect '/festivals'
    else
      flash[:message] = "Incorrect username and/or password."

      erb :'/users/login'
    end
  end

  post '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "You have successfully logged out."

      erb :'/users/login'
    else
      flash[:message] = "You can't logout if you're not even logged in!"

      redirect '/login'
    end
  end

  get '/users/:username' do
    if logged_in?
      @user = User.find_by(username: params[:username])

      if @user
        erb :'/users/show'
      else
        flash[:message] = "User does not exist."

        redirect '/festivals'
      end

    else
      flash[:message] = "You must be logged in to do that."

      redirect '/login'
    end
  end

end
