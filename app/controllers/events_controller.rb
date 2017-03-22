class EventsController < ApplicationController

  get '/events' do
    redirect_if_not_logged_in
    @events = Event.all

    erb :'/events/events'
  end


end
