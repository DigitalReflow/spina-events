FactoryBot.define do
  factory :spina_events_conference, class: Spina::Events::Conference do
    sequence(:title) { |n| "Event Conference #{n}" }
    description "Some content for my conference"

    factory :invalid_spina_events_conference do
      title nil
    end
  end
end
