class DropEventVenues < ActiveRecord::Migration[5.0]
  def change
    drop_table :event_venues
  end
end
