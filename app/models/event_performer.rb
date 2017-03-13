class EventPerformer < ActiveRecord::Base
  belongs_to :event 
  belongs_to :performer
end