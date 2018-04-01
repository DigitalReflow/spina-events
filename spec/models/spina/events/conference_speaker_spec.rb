require 'rails_helper'

module Spina::Events
  RSpec.describe ConferenceSpeaker, type: :model do
    it { should validate_presence_of(:conference_id) }
    it { should validate_presence_of(:speaker_id) }
  end
end
