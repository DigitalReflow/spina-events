require 'rails_helper'

RSpec.describe Spina::Admin::Events::ConferencesController, type: :controller do
  let(:conferences) { FactoryBot.create_list :spina_events_conference, 3 }
  let(:events_conference) { FactoryBot.create :spina_events_conference }
  let(:draft_conferences) { FactoryBot.create_list :spina_events_conference, 3, draft: true }
  let(:live_conferences) { FactoryBot.create_list :spina_events_conference, 3, draft: false }
  let(:conference_attributes) { FactoryBot.attributes_for :spina_events_conference }

  routes { Spina::Engine.routes }

  context 'signed in as an admin' do
    before { sign_in }

    describe 'GET #index' do
      subject { get :index }

      it { is_expected.to have_http_status :success }
      it { is_expected.to render_template :index }
      it {
        subject
        expect(assigns(:conferences)).to match_array conferences
      }
    end

    describe 'GET #new' do
      subject { get :new }

      it { is_expected.to have_http_status :success }
      it { is_expected.to render_template :new }
    end

    describe 'POST #create' do
      subject { post :create, params: { conference: conference_attributes } }

      it { is_expected.to have_http_status :redirect }
      it {
        subject
        expect(flash[:notice]).to eq 'Conference saved'
      }
      it { expect{subject}.to change(Spina::Events::Conference, :count).by(1) }

      context 'with invalid attributes' do
        subject { post :create, params: { conference: { content: 'foo' } } }

        it { is_expected.to_not have_http_status :redirect }
        it { expect{subject}.to_not change(Spina::Events::Conference, :count) }
        it { is_expected.to render_template :new }
      end
    end

    describe 'GET #edit' do
      subject { get :edit, params: { id: events_conference.id } }

      it { is_expected.to have_http_status :success }
      it { is_expected.to render_template :edit }
    end

    describe 'PATCH #update' do
      subject { patch :update, params: { id: events_conference.id, conference: conference_attributes } }

      it { is_expected.to have_http_status :redirect }
      it {
        subject
        expect(flash[:notice]).to eq 'Conference saved'
      }
      it { expect{subject}.to change{events_conference.reload.title} }

      context 'with invalid attributes' do
        subject { patch :update, params: { id: events_conference.id, conference: { title: '' } } }

        it { is_expected.to_not have_http_status :redirect }
        it { is_expected.to render_template :edit }
        it { expect{subject}.to_not change{events_conference.reload.title} }
      end
    end

    describe 'DELETE #destroy' do
      let!(:events_conference) { FactoryBot.create :spina_events_conference }

      subject { delete :destroy, params: { id: events_conference.id } }

      it { expect{subject}.to change(Spina::Events::Conference, :count).by(-1) }
    end
  end

  context 'signed out' do
    describe 'GET #index' do
      subject { get :index }
      it { is_expected.to have_http_status :redirect }
      it { is_expected.to_not render_template :index }
    end
  end
end
