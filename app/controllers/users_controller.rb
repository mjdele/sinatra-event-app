class UsersController < ApplicationController
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