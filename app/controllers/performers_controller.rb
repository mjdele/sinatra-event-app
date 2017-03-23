class PerformersController < ApplicationController

  get '/performers' do
    redirect_if_not_logged_in
    @performers = Performer.all

    erb :'/performers/index'
  end

  get '/performers/:id' do
    redirect_if_not_logged_in
    @performer = Performer.find_by_id(params[:id])
    erb :'/performers/show'
  end

end