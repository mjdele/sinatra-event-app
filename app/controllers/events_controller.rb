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
    @event = Event.new(params[:event])
    if !params["performer"]["name"].empty?
      @event.performers << Performer.find_or_create_by(name: params["performer"]["name"])
    end
    if !params["venue"]["name"].empty? && !params["venue"]["location"].empty? && !params["event"]["venue_id"]
      @event.venue = Venue.find_or_create_by(params[:venue])
    elsif @event.venue.nil?
      flash[:message] = "***YOU NEED TO DESIGNATE A VENUE FOR YOUR EVENT***"
      redirect to "/events/new"
    elsif @event.performers.empty?
      flash[:message] = "***YOU NEED TO DESIGNATE PERFORMERS FOR YOUR EVENT***"
      redirect to "/events/new"
    end
    @event.save
    redirect to "/events/#{@event.id}"
  end

  get '/events/:id' do
    redirect_if_not_logged_in
    @event = Event.find_by_id(params[:id])
    erb :'/events/show'
  end

  post '/events/show' do
    if !current_user.events.include?(Event.find_by_id(params["event"]["id"]))
      current_user.events << Event.find_by_id(params["event"]["id"])
      redirect "/users/#{current_user.slug}"
    else
      flash[:message] = "***THAT EVENT HAS ALREADY BEEN ADDED TO YOUR EVENTS PAGE***"
      redirect to "/events"
    end

  end


end
