require 'rails_helper'

module Spina::Events
  RSpec.describe Venue, type: :model do
    let(:venue) { FactoryBot.build :spina_events_venue }

    subject { venue }

    it { is_expected.to be_valid }
    it { expect{venue.save}.to change(Spina::Events::Venue, :count).by(1) }

    context 'with invalid attributes' do
      let(:venue) { FactoryBot.build :invalid_spina_events_venue }

      it { is_expected.to_not be_valid }
      it { expect{venue.save}.to_not change(Spina::Events::Venue, :count) }
    end

    describe '#full_address' do
      it 'returns the formatted full address' do
        venue = Venue.new(
          address_line_1: '123 street',
          address_line_2: 'appt 406',
          city: 'Orlando',
          postcode: 48303,
          country: 'US'
        )
        expect(venue.full_address).to eq('123 street, appt 406, Orlando, 48303, US')
      end
    end
  end
end
