FactoryBot.define do
  factory :spina_events_session, class: Spina::Events::Session do
    sequence(:title) { |n| "Session #{n}" }
    association :conference, factory: :spina_events_conference
    description 'Good session'
    duration_minutes 60
    position 1
    day 1
  end
end
