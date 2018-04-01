require 'rails_helper'

module Spina::Events
  RSpec.describe ConferenceAttendee, type: :model do
    it { should validate_presence_of(:conference_id) }
    it { should validate_presence_of(:organisation_id) }
  end
end
