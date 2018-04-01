require 'rails_helper'

module Spina::Events
  RSpec.describe SessionSpeaker, type: :model do
    it { should validate_presence_of(:session_id) }
    it { should validate_presence_of(:speaker_id) }
  end
end
