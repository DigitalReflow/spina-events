FactoryBot.define do
  factory :spina_events_session, class: Spina::Events::Session do
    sequence(:title) { |n| "Session #{n}" }
    association :conference, factory: :spina_events_conference
    description 'Good session'
    start_at Time.now.advance(days: 1)
    end_at Time.now.advance(days: 1, hours: 1)
  end
end
