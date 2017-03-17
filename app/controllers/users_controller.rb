class UsersController < ApplicationController

  get '/user/:slug' do
    erb :'users/show'
  end

  get '/login' do
    erb :'users/login'
  end

  get '/signup' do
    erb :'users/create_user'
  end

  get '/logout' do
    "This will clear the session data and redirct to '/'"
  end
end