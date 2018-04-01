require 'rails_helper'

module Spina::Events
  RSpec.describe ConferenceAttendee, type: :model do
    it 'validates presence of conference' do
      conference_attendee = ConferenceAttendee.new
      expect(conference_attendee.valid?).to be(false)
      expect(conference_attendee.errors.keys).to include(:conference_id)
    end

    it 'validates presence of organisation' do
      conference_attendee = ConferenceAttendee.new
      expect(conference_attendee.valid?).to be(false)
      expect(conference_attendee.errors.keys).to include(:organisation_id)
    end
  end
end
