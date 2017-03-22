class UsersController < ApplicationController

  get '/user/:slug' do
    erb :'users/show'
  end

  get '/signup' do
    if logged_in?
      redirect to '/events'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    if params["username"] == "" || params["password"] == ""
      redirect to '/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to '/events'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/events'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/events'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
#      redirect to '/login'
      redirect "/login?error=You have to be logged in to do that"
    else
      redirect to '/'
    end
  end

end



