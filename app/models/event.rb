class Event < ActiveRecord::Base
  has_many :performers
  has_many :event_venues
  has_many :venues, through: :event_venues
  belongs_to :user
end