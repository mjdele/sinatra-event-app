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

    venue_input_validation
    performer_input_validation

    @event.save
    current_user.events << @event
    redirect "/users/#{current_user.slug}"
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
    @event = Event.find_by_id(params[:id])
    @event.update(params[:event])

    performer_input_validation
    @event.save 
    redirect to "/events/#{@event.id}"
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
