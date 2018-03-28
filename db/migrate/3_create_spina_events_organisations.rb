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

    create_table :spina_events_organisation_translations do |t|
      t.integer :spina_events_organisation_id, null: false
      t.string :locale, null: false
      t.string :name
      t.string :website
      t.string :slug
      t.string :twitter
      t.string :linkedin
      t.string :facebook
    end

    add_index :spina_events_organisation_translations, :locale
    add_index :spina_events_organisation_translations, :spina_events_organisation_id, name: "organisation_tranlations_index"
  end
end
