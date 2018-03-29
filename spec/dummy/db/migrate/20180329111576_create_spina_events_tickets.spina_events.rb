# This migration comes from spina_events (originally 10)
class CreateSpinaEventsTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_tickets do |t|
      t.string :name
      t.text :description
      t.string :code
      t.decimal :price, precision: 8, scale: 2, default: 0.0
      t.integer :conference_id
      t.integer :position
    end

    add_index :spina_events_tickets, :conference_id

    create_table :spina_events_ticket_translations do |t|
      t.integer :spina_events_ticket_id, null: false
      t.string :locale, null: false
      t.string :name
      t.text :description
    end

    add_index :spina_events_ticket_translations, :locale
    add_index :spina_events_ticket_translations, :spina_events_ticket_id, name: "ticket_translations_index"
  end
end
