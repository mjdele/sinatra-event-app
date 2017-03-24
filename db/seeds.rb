event_list = {
    "Coachella" => {
      :date => "4-14-2017"
    },
    "Stagecoach Festival" => {
      :date => "5-12-2017"
    },
    "Governor's Ball" => {
      :date => "6-2-2017"
    },
    "Panorama Music Festival" => {
      :date => "7-29-2017"
    },
    "Bonnaroo" => {
      :date => "6-8-2017"
    },
    "Lollapalooza" => {
      :date => "8-3-2017"
    },
    "Chicago Blues Festival" => {
      :date => "6-9-2017"
    },
    "Father John Misty: The Pure Comedy Tour" => {
      :date => "5-5-2017"
    },
    "Spoon: Hot Thoughts Tour" => {
      :date => "4-23-2017"
    }
  }

event_list.each do |name, event_hash|
  p = Event.new
  p.name = name
  event_hash.each do |attribute, value|
    p[attribute] = value
  end
  p.save
end

performer_list = {
    "Arcade Fire" => {
    },
    "The Strokes" => {
    },
    "Taylor Swift" => {
    },
    "B.B. King" => {
    },
    "Chance the Rapper" => {
    },
    "LCD Soundsystem" => {
    },
    "Radiohead" => {
    },
    "Spoon" => {
    },
    "The Cults" => {
    },
    "Amy Grant" => {
    },
    "Father John Misty" => {
    },
    "Billy Ray Cyrus" => { 
    }
  }

performer_list.each do |name, performer_hash|
  p = Performer.new
  p.name = name
  p.save
end


venue_list = {
    "Polo Grounds" => {
      :location => "Indio, CA"
    },
    "Randall's Island Park" => {
      :location => "New York, NY"
    },
    "Golden Gate Park" => {
      :location => "San Francisco, CA"
    },
    "Grant Park" => {
      :location => "Chicago, IL"
    },
    "Webster Hall" => {
      :location => "New York, NY"
    },
    "Great Stage Park" => {
      :location => "Manchester, TN"
    }
  }

venue_list.each do |name, venue_hash|
  p = Venue.new
  p.name = name
  venue_hash.each do |attribute, value|
    p[attribute] = value
  end
  p.save
end

Venue.find_by(name: "Polo Grounds").events << Event.find_by(name: "Coachella")
Venue.find_by(name: "Polo Grounds").events << Event.find_by(name: "Stagecoach Festival")
Venue.find_by(name: "Randall's Island Park").events << Event.find_by(name: "Governor's Ball")
Venue.find_by(name: "Randall's Island Park").events << Event.find_by(name: "Panorama Music Festival")

Event.find_by(name: "Coachella").events << Performer.find_by(name: "Father John Misty")
Event.find_by(name: "Coachella").events << Performer.find_by(name: "Arcade Fire")
Event.find_by(name: "Coachella").events << Performer.find_by(name: "The Strokes")
Event.find_by(name: "Coachella").events << Performer.find_by(name: "LCD Soundsystem")

Event.find_by(name: "Stagecoach Festival").events << Performer.find_by(name: "Taylor Swift")
Event.find_by(name: "Stagecoach Festival").events << Performer.find_by(name: "Billy Ray Cyrus")
Event.find_by(name: "Stagecoach Festival").events << Performer.find_by(name: "Amy Grant")

Event.find_by(name: "Governor's Ball").events << Performer.find_by(name: "Chance the Rapper")
Event.find_by(name: "Governor's Ball").events << Performer.find_by(name: "Spoon")
Event.find_by(name: "Governor's Ball").events << Performer.find_by(name: "The Cults")

Event.find_by(name: "Panorama Music Festival").events << Performer.find_by(name: "Taylor Swift")
Event.find_by(name: "Panorama Music Festival").events << Performer.find_by(name: "Arcade Fire")
Event.find_by(name: "Panorama Music Festival").events << Performer.find_by(name: "LCD Soundsystem")





