FactoryBot.define do
  factory :spina_events_speaker, class: Spina::Events::Speaker do
    sequence(:name) { |n| "Speaker #{n}" }

    factory :invalid_spina_events_speaker do
      name nil
    end
  end
end
