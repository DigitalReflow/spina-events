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
  end
end
