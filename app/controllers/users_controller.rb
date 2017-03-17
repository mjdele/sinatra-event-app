class UsersController < ApplicationController

  get '/user/:slug' do
    erb :'users/show'
  end

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    if params["username"] == "" || params["password"] == ""
      redirect to '/signup'
    else
      @user = User.create(params)
      session[:id] = @user.id
      redirect to '/events'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do

  end

  get '/logout' do
    "This will clear the session data and redirct to '/'"
  end
end