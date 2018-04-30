require 'rails_helper'

module Spina::Events
  RSpec.describe Ticket, type: :model do
    let(:ticket) { Ticket.new }
    it 'validates the presence of name' do
      expect(ticket.valid?).to be(false)
      expect(ticket.errors.keys).to include(:name)
    end

    it 'validates the presence of description' do
      expect(ticket.valid?).to be(false)
      expect(ticket.errors.keys).to include(:description)
    end

    it 'validates the presence of code' do
      expect(ticket.valid?).to be(false)
      expect(ticket.errors.keys).to include(:code)
    end

    it 'validates the presence of current_price' do
      ticket.current_price = nil
      expect(ticket.valid?).to be(false)
      expect(ticket.errors.keys).to include(:current_price)
    end
  end
end
