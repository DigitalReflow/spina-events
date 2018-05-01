class AddPositionToSpinaEventsConferenceSpeakers < ActiveRecord::Migration[5.1]
  def change
    add_column :spina_events_conference_speakers, :position, :integer, default: 0
    remove_column :spina_events_speakers, :position, :integer
  end
end
