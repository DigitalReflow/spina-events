module Spina::Events
  class ConferenceSpeaker < ApplicationRecord
    validates :conference_id, :speaker_id, presence: true
    belongs_to :conference
    belongs_to :speaker
  end
end
