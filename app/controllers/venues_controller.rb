class VenuesController < ApplicationController

  get '/venues' do
    redirect_if_not_logged_in
    @venues = Venue.all

    erb :'/venues/index'
  end

  get '/venues/:id' do
    redirect_if_not_logged_in
    @venue = Venue.find_by_id(params[:id])
    erb :'/venues/show'
  end

end