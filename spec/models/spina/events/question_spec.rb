require 'rails_helper'

module Spina::Events
  RSpec.describe Question, type: :model do
    let(:question) { FactoryBot.build :spina_events_question }

    subject { question }

    it { is_expected.to be_valid }
    it { expect{question.save}.to change(Spina::Events::Question, :count).by(1) }

    context 'with invalid attributes' do
      let(:question) { FactoryBot.build :invalid_spina_events_question }

      it { is_expected.to_not be_valid }
      it { expect{question.save}.to_not change(Spina::Events::Question, :count) }
    end
  end
end
