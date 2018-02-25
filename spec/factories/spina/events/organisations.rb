FactoryBot.define do
  factory :spina_events_organisation, class: Spina::Events::Organisation do
    sequence(:name) { |n| "Organisation #{n}" }

    factory :invalid_spina_events_organisation do
      name nil
    end
  end
end
