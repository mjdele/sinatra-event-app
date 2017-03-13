class RemoveEventIdFromPerformers < ActiveRecord::Migration[5.0]
  def change
    remove_column :performers, :event_id, :integer
  end
end
