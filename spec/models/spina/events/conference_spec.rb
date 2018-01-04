require 'rails_helper'

module Spina::Events
  RSpec.describe Conference, type: :model do
    let(:conference) { FactoryBot.build :spina_events_conference }

    subject { conference }

    it { is_expected.to be_valid }
    it { expect{conference.save}.to change(Spina::Events::Conference, :count).by(1) }

    context 'with invalid attributes' do
      let(:conference) { FactoryBot.build :invalid_spina_events_conference }

      it { is_expected.to_not be_valid }
      it { expect{conference.save}.to_not change(Spina::Events::Conference, :count) }
    end
  end
end
