class EventsController < ApplicationController

  get '/events' do
    redirect_if_not_logged_in
    @events = Event.all
    erb :'/events/index'
  end

  get '/events/new' do
    erb :'/events/new'
  end

  post '/events' do
    @event = Event.create(name: params["event"]["name"], date: params["event"]["date"])
    @event.performers << Performer.find_or_create_by(name: params["performer"]["name"])
    binding.pry
    if !!params["event"]["venue_id"] && params["venue"]["name"].empty
      @event.venue
    end    
  end

  get '/events/:id' do
    redirect_if_not_logged_in
    @event = Event.find_by_id(params[:id])
    erb :'/events/show'
  end

  post '/events/show' do
    current_user.events << Event.find_by_id(params["event"]["id"])
    #add event unless it's already there --> create a condintional for duplicate events
    redirect "/users/#{current_user.slug}"
  end


end
