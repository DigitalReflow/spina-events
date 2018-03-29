# This migration comes from spina_events (originally 6)
class CreateSpinaEventsConferenceSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_conference_speakers do |t|
      t.integer :conference_id
      t.integer :speaker_id
    end
  end
end
