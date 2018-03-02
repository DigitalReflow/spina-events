class CreateSpinaEventsConferenceAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_conference_attendees do |t|
      t.integer :conference_id
      t.integer :organisation_id
    end
  end
end
