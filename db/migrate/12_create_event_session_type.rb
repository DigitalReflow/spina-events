class CreateEventSessionType < ActiveRecord::Migration[5.1]
  def change
    create_table :event_session_types do |t|
      t.string :name
      t.integer :session_id
      t.timestamps
    end

    add_index :event_session_types, :session_id
  end
end
