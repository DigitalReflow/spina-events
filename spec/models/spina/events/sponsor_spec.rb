require 'rails_helper'

module Spina::Events
  RSpec.describe Sponsor, type: :model do
    it 'validates the presence of sponsor_type' do
      sponsor = Sponsor.new
      expect(sponsor.valid?).to be(false)
      expect(sponsor.errors.keys).to include(:sponsor_type)
    end
  end
end
