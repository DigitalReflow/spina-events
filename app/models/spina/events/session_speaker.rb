module Spina::Events
  class SessionSpeaker < ApplicationRecord
    validates :session_id, :speaker_id, presence: true
    belongs_to :session
    belongs_to :speaker
  end
end
