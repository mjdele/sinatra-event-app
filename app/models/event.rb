class Event < ActiveRecord::Base
  has_many :performers
  belongs_to :user
  belongs_to :venue
end