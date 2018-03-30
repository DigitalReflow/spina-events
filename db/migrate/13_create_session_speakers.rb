class CreateSessionSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_session_speakers do |t|
      t.integer :session_id
      t.integer :speaker_id
      t.timestamps
    end
    add_index :spina_events_session_speakers, [:session_id, :speaker_id], name: 'index_session_speakers_on_session_id_and_speaker_id'
  end
end
