require 'rails_helper'

module Spina::Events
  RSpec.describe SessionSpeaker, type: :model do
    it 'validates presence of session' do
      session_speaker = SessionSpeaker.new
      expect(session_speaker.valid?).to be(false)
      expect(session_speaker.errors.keys).to include(:session_id)
    end

    it 'validates presence of speaker' do
      session_speaker = SessionSpeaker.new
      expect(session_speaker.valid?).to be(false)
      expect(session_speaker.errors.keys).to include(:speaker_id)
    end
  end
end
