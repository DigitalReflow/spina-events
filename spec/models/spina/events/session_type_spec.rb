require 'rails_helper'

module Spina::Events
  RSpec.describe SessionType, type: :model do
    it { should validate_presence_of(:name) }
  end
end
