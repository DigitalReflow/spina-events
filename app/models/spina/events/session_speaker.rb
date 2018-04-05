module Spina::Events
  class SessionSpeaker < ApplicationRecord
    validates :session, :speaker, presence: true
    belongs_to :session
    belongs_to :speaker
  end
end
