require 'rails_helper'

module Spina::Events
  RSpec.describe ConferenceSpeaker, type: :model do
    it 'validates presence of conference' do
      conference_speaker = ConferenceSpeaker.new
      expect(conference_speaker.valid?).to be(false)
      expect(conference_speaker.errors.keys).to include(:conference_id)
    end

    it 'validates presence of speaker' do
      conference_speaker = ConferenceSpeaker.new
      expect(conference_speaker.valid?).to be(false)
      expect(conference_speaker.errors.keys).to include(:speaker_id)
    end
  end
end
