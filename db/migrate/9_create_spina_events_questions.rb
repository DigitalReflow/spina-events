class CreateSpinaEventsQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_questions do |t|
      t.string :title
      t.text :body
      t.integer :position
      t.integer :conference_id

      t.timestamps
    end
  end
end
