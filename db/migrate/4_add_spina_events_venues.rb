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
  end
end
