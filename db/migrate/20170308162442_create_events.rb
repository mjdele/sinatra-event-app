class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events |t|
      t.string :name
      t.date :date
      t.integer :user_id
    end
  end
end
