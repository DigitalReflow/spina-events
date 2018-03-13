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
  end
end
