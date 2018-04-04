require 'rails_helper'

module Spina::Events
  RSpec.describe SessionSpeaker, type: :model do
    it { should validate_presence_of(:session) }
    it { should validate_presence_of(:speaker) }
  end
end
