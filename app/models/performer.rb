class Performer < ActiveRecord::Base
  has_many :event_performers
  has_many :events, through: :event_performers
end