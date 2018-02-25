class CreateSpinaEventsOrganisations < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_organisations do |t|
      t.string :name
      t.string :website
      t.string :slug
      t.string :twitter
      t.string :linkedin
      t.string :facebook
      t.integer :photo_id

      t.timestamps
    end
  end
end
