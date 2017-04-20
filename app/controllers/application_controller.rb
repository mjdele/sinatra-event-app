require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "showtime"
    use Rack::Flash
  end

  get '/' do
    erb :index
  end

 helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:message] = "***YOU NEED TO BE LOGGED IN TO DO THAT***"
        redirect "/login"
      end
    end

    def logged_in? 
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def performer_input_validation
      if !params["performer"]["name"].empty?
        @event.performers << Performer.find_or_create_by(name: params["performer"]["name"])
      elsif @event.performers.empty?
        flash[:message] = "***YOU NEED TO DESIGNATE PERFORMER(S) FOR YOUR EVENT***"
        redirect to "/events/new"
      end
    end

    def venue_input_validation
      if !params["venue"]["name"].empty? && !params["venue"]["location"].empty? && !params["event"]["venue_id"]
        @event.venue = Venue.find_or_create_by(params[:venue])
      elsif !params["venue"]["name"].empty? && !params["venue"]["location"].empty? && params["event"]["venue_id"]
        flash[:message] = "***YOU CAN ONLY DESIGNATE ONE VENUE FOR YOUR EVENT***"
        redirect to "/events/new"
      elsif @event.venue.nil?
        flash[:message] = "***YOU NEED TO DESIGNATE A VENUE FOR YOUR EVENT***"
        redirect to "/events/new"
      end
    end

  end
end