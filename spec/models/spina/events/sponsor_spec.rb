require 'rails_helper'

module Spina::Events
  RSpec.describe Sponsor, type: :model do
    it { should validate_presence_of(:sponsor_type) }
  end
end
