ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do
  Pry.start
end

task :reload do
  User.destroy_all
  Event.destroy_all
  Performer.destroy_all
  Venue.destroy_all
  UserEvent.destroy_all
  EventPerformer.destroy_all
end
# Type `rake -T` on your command line to see the available rake tasks.