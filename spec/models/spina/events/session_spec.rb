require 'rails_helper'

module Spina::Events
  RSpec.describe Session, type: :model do
    let(:session) { FactoryBot.build :spina_events_session }

    subject { session }

    it { is_expected.to be_valid }
    it { expect{ session.save }.to change(Spina::Events::Session, :count).by(1) }

    context 'with invalid attributes' do
      let(:session) { FactoryBot.build :spina_events_session, title: nil }

      it { is_expected.to_not be_valid }
      it { expect{ session.save }.to_not change(Spina::Events::Session, :count) }
    end
  end
end
