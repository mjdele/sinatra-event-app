class UsersController < ApplicationController

  get '/user/:slug' do
    "This shows the users events he is attending."
  end

  get '/login' do
    "This is where you login."
  end

  get '/signup' do
    "This is were you signup."
  end

  get '/logout' do
    "This will log you out."
  end
end