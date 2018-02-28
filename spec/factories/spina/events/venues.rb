FactoryBot.define do
  factory :spina_events_venue, class: Spina::Events::Venue do
    sequence(:name) { |n| "Venue #{n}" }

    factory :invalid_spina_events_venue do
      name nil
    end
  end
end
