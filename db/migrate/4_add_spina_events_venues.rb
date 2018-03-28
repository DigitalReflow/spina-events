class AddSpinaEventsVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_venues do |t|
      t.string :name
      t.text :description
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :country
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.string :slug
      t.integer :photo_id

      t.timestamps
    end

    create_table :spina_events_venue_translations do |t|
      t.integer :spina_events_venue_id, null: false
      t.string :locale, null: false
      t.string :name
      t.text :description
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :country
      t.string :postcode
      t.string :slug
    end

    add_index :spina_events_venue_translations, :locale
    add_index :spina_events_venue_translations, :spina_events_venue_id, name: "venue_tranlations_index"
  end
end
