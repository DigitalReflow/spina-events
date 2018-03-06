class CreateSpinaEventsSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_sponsors do |t|
      t.string :sponsor_type
      t.integer :conference_id
      t.integer :organisation_id
    end
  end
end
