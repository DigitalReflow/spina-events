class CreateSpinaEventsQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :spina_events_questions do |t|
      t.string :title
      t.text :body
      t.integer :position
      t.integer :conference_id

      t.timestamps
    end

    create_table :spina_events_question_translations do |t|
      t.integer :spina_events_question_id, null: false
      t.string :locale, null: false
      t.string :title
      t.text :body
    end

    add_index :spina_events_question_translations, :locale
    add_index :spina_events_question_translations, :spina_events_question_id, name: "question_tranlations_index"
  end
end
