require 'rails_helper'

RSpec.describe Spina::Events::ConferencesController, type: :controller do
  let!(:account) { ::Spina::Account.create name: 'MySite', theme: 'default' }

  routes { Spina::Engine.routes }

  let(:draft_past_conferences) { FactoryBot.create_list :spina_events_conference, 3, draft: true }
  let(:live_past_conferences) { FactoryBot.create_list :spina_events_conference, 3, draft: false }

  describe 'GET #index' do
    subject { get :index }

    before do
      draft_past_conferences
      live_past_conferences
    end

    it {
      subject
      expect(assigns(:conferences)).to match_array live_past_conferences
    }
  end

  describe 'GET #show' do
    let(:events_conference) { FactoryBot.create :spina_events_conference }

    subject { get :show, params: { id: events_conference.id } }

    it {
      subject
      expect(assigns(:conference)).to eq events_conference
    }
    it { is_expected.to render_template :show }
    it { is_expected.to have_http_status :success }
  end
end
