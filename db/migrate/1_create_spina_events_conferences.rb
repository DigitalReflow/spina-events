class CreateSpinaEventsConferences < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_conferences do |t|
      t.string :title
      t.text :description
      t.string :slug, unique: true
      t.boolean :draft, default: true
      t.integer :photo_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.text :sponsorship_info
      t.text :conference_contact
      t.integer :attachment_id

      t.timestamps
    end

    add_index :spina_events_conferences, :slug
  end
end
