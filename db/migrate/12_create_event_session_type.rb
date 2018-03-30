class CreateEventSessionType < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_session_types do |t|
      t.string :name
      t.integer :session_id
      t.timestamps
    end

    add_index :spina_events_session_types, :session_id
  end
end
