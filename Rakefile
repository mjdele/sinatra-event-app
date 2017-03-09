ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do
  Pry.start
end

task :reload do
  User.delete_all
  Event.delete_all
  Performer.delete_all
  Venue.delete_all

  User.create(username: "mjd")
  Event.create(name: "Stagecoach Festival", date: "5-12-2017")
  Event.create(name: "Coachella", date: "4-14-2017")
  Venue.create(name: "Polo Grounds", location: "Indio, CA")
  Performer.create(name: "Arcade Fire")
  Performer.create(name: "Billy Ray Cyrus")
  Performer.create(name: "The Strokes")
end
# Type `rake -T` on your command line to see the available rake tasks.