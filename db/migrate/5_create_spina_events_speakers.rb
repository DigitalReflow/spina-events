class CreateSpinaEventsSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_speakers do |t|
      t.string :name
      t.string :slug
      t.string :job_title
      t.text :bio
      t.integer :position
      t.integer :photo_id
      t.integer :organisation_id

      t.timestamps
    end

    create_table :spina_events_speaker_translations do |t|
      t.integer :spina_events_speaker_id, null: false
      t.string :locale, null: false
      t.string :name
      t.string :slug
      t.string :job_title
      t.text :bio
    end

    add_index :spina_events_speaker_translations, :locale
    add_index :spina_events_speaker_translations, :spina_events_speaker_id, name: "speaker_tranlations_index"
  end
end
