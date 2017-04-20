class Event < ActiveRecord::Base
  has_many :user_events
  has_many :event_performers
  has_many :performers, through: :event_performers
  has_many :users, through: :user_events
  belongs_to :venue

end