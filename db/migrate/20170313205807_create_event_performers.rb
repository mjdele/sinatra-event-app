class CreateEventPerformers < ActiveRecord::Migration[5.0]
  def change 
    create_table :event_performers do |t|
      t.integer :event_id
      t.integer :performer_id
    end
  end
end
