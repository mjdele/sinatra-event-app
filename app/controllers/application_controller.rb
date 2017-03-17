require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "showtime"
  end

  get '/' do
    "If logged in => events.rb (showing users event) OR if not logged in => home.erb (showing login or signup links); the redirect if logged in might be handled by the 'LOGIN' route"
  end

end