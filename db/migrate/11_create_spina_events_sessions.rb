class CreateSpinaEventsSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_sessions do |t|
      t.integer :conference_id
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
    add_index :spina_events_sessions, :conference_id
  end
end
