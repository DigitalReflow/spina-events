module Spina::Events
  class ConferenceAttendee < ApplicationRecord
    validates :conference_id, :organisation_id, presence: true
    belongs_to :conference
    belongs_to :organisation
  end
end
