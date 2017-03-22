class EventsController < ApplicationController

  get '/events' do
    redirect_if_not_logged_in
    @events = Event.all

    erb :'/events/events'
  end

  get '/events/:id' do
    redirect_if_not_logged_in
    @event = Event.find_by_id(params[:id])
    erb :'/events/show'
  end


end
