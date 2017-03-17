class UsersController < ApplicationController

  get '/user/:slug' do
    erb :'users/show'
  end

  get '/signup' do
    erb :'users/create_user'
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    binding.pry
  end

  get '/logout' do
    "This will clear the session data and redirct to '/'"
  end
end