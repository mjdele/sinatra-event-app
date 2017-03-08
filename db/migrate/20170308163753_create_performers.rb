class CreatePerformers < ActiveRecord::Migration[5.0]
  def change
    create_table :performers |t|
      t.string :name
      t.integer :event_id
    end
  end
end
