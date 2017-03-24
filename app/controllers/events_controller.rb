class EventsController < ApplicationController

  get '/events' do
    redirect_if_not_logged_in
    @events = Event.all
    erb :'/events/index'
  end

  get '/events/:id' do
    redirect_if_not_logged_in
    @event = Event.find_by_id(params[:id])
    erb :'/events/show'
  end

  post '/events' do
    current_user.events << Event.find_by_id(params["event"]["id"])
    #add event unless it's already there --> create a condintional
    redirect "/users/#{current_user.slug}"
  end


end
