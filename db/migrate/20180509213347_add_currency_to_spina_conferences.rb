class AddCurrencyToSpinaConferences < ActiveRecord::Migration[5.1]
  def change
    add_column :spina_events_conferences, :currency, :string, default: '£'
  end
end
