class CreateSpinaEventsConferences < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_conferences do |t|
      t.string :title
      t.string :sub_title
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
      t.integer :venue_id

      t.timestamps
    end

    add_index :spina_events_conferences, :slug

    create_table :spina_events_conference_translations do |t|
      t.integer :spina_events_conference_id, null: false
      t.string :locale, null: false
      t.string :title
      t.string :sub_title
      t.text :description
      t.text :conference_contact
      t.text :sponsorship_info
      t.string :slug
      t.string :location
    end

    add_index :spina_events_conference_translations, :locale
    add_index :spina_events_conference_translations, :spina_events_conference_id, name: "conference_tranlations_index"
  end
end
