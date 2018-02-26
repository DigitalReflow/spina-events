FactoryBot.define do
  factory :spina_events_conference, class: Spina::Events::Conference do
    sequence(:title) { |n| "Event Conference #{n}" }
    description "Some content for my conference"
    sequence(:start_date) { |n| Date.today + n.weeks }
    sequence(:end_date) { |n| Date.today + n.weeks + 1.day }

    factory :invalid_spina_events_conference do
      title nil
    end
  end
end
