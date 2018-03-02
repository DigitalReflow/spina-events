module Spina::Events
  class ConferenceAttendee < ApplicationRecord
    belongs_to :conference
    belongs_to :organisation
  end
end