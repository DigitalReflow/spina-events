require 'rails_helper'

module Spina::Events
  RSpec.describe Organisation, type: :model do
    let(:organisation) { FactoryBot.build :spina_events_organisation }

    subject { organisation }

    it { is_expected.to be_valid }
    it { expect{organisation.save}.to change(Spina::Events::Organisation, :count).by(1) }

    context 'with invalid attributes' do
      let(:organisation) { FactoryBot.build :invalid_spina_events_organisation }

      it { is_expected.to_not be_valid }
      it { expect{organisation.save}.to_not change(Spina::Events::Organisation, :count) }
    end
  end
end
