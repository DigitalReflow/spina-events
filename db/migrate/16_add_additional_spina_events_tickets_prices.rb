class AddAdditionalSpinaEventsTicketsPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :spina_events_tickets, :early_bird_price, :decimal, precision: 8, scale: 2, default: 0.0
    add_column :spina_events_tickets, :current_price, :decimal, precision: 8, scale: 2, default: 0.0
  end
end
