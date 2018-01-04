class CreateSpinaEventsConferences < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_conferences do |t|
      t.string :title
      t.text :description
      t.string :slug, unique: true
      t.boolean :draft, default: true
      t.belongs_to :photo

      t.timestamps
    end

    add_index :spina_events_conferences, :slug
  end
end
