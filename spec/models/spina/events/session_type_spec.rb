require 'rails_helper'

module Spina::Events
  RSpec.describe SessionType, type: :model do
    it 'validates presence of name' do
      session_type = SessionType.new
      expect(session_type.valid?).to be(false)
      expect(session_type.errors.keys).to include(:name)
    end
  end
end
