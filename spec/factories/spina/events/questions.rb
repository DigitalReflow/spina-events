FactoryBot.define do
  factory :spina_events_question, class: Spina::Events::Question do
    sequence(:title) { |n| "Question #{n}" }
    body "An answer to the question"

    factory :invalid_spina_events_question do
      title nil
    end
  end
end
