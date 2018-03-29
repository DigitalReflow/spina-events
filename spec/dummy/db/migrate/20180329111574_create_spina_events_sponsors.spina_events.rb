# This migration comes from spina_events (originally 8)
class CreateSpinaEventsSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_sponsors do |t|
      t.string :sponsor_type
      t.integer :conference_id
      t.integer :organisation_id
    end

    create_table :spina_events_sponsor_translations do |t|
      t.integer :spina_events_sponsor_id, null: false
      t.string :locale, null: false
      t.string :sponsor_type
    end

    add_index :spina_events_sponsor_translations, :locale
    add_index :spina_events_sponsor_translations, :spina_events_sponsor_id, name: "sponsor_tranlations_index"
  end
end
