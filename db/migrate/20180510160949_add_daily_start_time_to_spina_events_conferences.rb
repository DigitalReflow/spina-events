class AddDailyStartTimeToSpinaEventsConferences < ActiveRecord::Migration[5.1]
  def change
    add_column :spina_events_conferences, :daily_start_time, :time
  end
end
