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

#  User.create(username: "mjd")
#  User.create(username: "sara")
#  Event.create(name: "Stagecoach Festival", date: "5-12-2017")
#  Event.create(name: "Coachella", date: "4-14-2017")
#  Venue.create(name: "Polo Grounds", location: "Indio, CA")
#  Venue.create(name: "Randall's Island Park", location: "New York, NY")
#  Performer.create(name: "Arcade Fire")
#  Performer.create(name: "Billy Ray Cyrus")
#  Performer.create(name: "Taylor Swift")
#  Performer.create(name: "The Strokes")
end
# Type `rake -T` on your command line to see the available rake tasks.