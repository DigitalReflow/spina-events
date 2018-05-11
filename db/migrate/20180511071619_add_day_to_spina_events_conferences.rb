class AddDayToSpinaEventsConferences < ActiveRecord::Migration[5.1]
  def change
    add_column :spina_events_sessions, :day, :integer, default: 0
  end
end
