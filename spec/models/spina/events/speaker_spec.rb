require 'rails_helper'

module Spina::Events
  RSpec.describe Speaker, type: :model do
    let(:speaker) { FactoryBot.build :spina_events_speaker }

    subject { speaker }

    it { is_expected.to be_valid }
    it { expect{speaker.save}.to change(Spina::Events::Speaker, :count).by(1) }

    context 'with invalid attributes' do
      let(:speaker) { FactoryBot.build :invalid_spina_events_speaker }

      it { is_expected.to_not be_valid }
      it { expect{speaker.save}.to_not change(Spina::Events::Speaker, :count) }
    end

    it "generates a slug" do
      expect(speaker.slug).to be_nil
      speaker.save
      expect(speaker.slug).to be_present
    end
  end
end
