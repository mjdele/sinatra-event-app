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
    if Event.find_by_name_and_date(params[:event][:name], params[:event][:date])
      flash[:message] = "***THIS EVENT ALREADY EXISTS***"
      redirect to "/events/new"
    else
      @event = Event.new(params[:event])
    end

    if !params["performer"]["name"].empty?
      @event.performers << Performer.find_or_create_by(name: params["performer"]["name"])
    elsif @event.performers.empty?
      flash[:message] = "***YOU NEED TO DESIGNATE PERFORMER(S) FOR YOUR EVENT***"
      redirect to "/events/new"
    end

    if !params["venue"]["name"].empty? && !params["venue"]["location"].empty? && !params["event"]["venue_id"]
      @event.venue = Venue.find_or_create_by(params[:venue])
    elsif !params["venue"]["name"].empty? && !params["venue"]["location"].empty? && params["event"]["venue_id"]
      flash[:message] = "***YOU CAN ONLY DESIGNATE ONE VENUE FOR YOUR EVENT***"
      redirect to "/events/new"
    elsif @event.venue.nil?
      flash[:message] = "***YOU NEED TO DESIGNATE A VENUE FOR YOUR EVENT***"
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

  get '/events/:id/edit' do
    redirect_if_not_logged_in
    @event = Event.find_by_id(params[:id])
    erb :'/events/edit'
  end

  patch '/events/:id' do
    binding.pry
    @event = Event.find_by_id(params[:id])

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
