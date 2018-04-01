class AddPositionAndDurationToSession < ActiveRecord::Migration[5.1]
  def up
    remove_column :spina_events_sessions, :start_at
    remove_column :spina_events_sessions, :end_at
    add_column :spina_events_sessions, :position, :integer
    add_column :spina_events_sessions, :duration_minutes, :integer
  end

  def down
    add_column :spina_events_sessions, :start_at, :datetime
    add_column :spina_events_sessions, :end_at, :datetime
    remove_column :spina_events_sessions, :position
    remove_column :spina_events_sessions, :duration_minutes
  end
end
