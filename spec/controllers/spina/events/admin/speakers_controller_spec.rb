require 'rails_helper'

RSpec.describe Spina::Events::Admin::SpeakersController, type: :controller do
  let(:speakers) { FactoryBot.create_list :spina_events_speaker, 3 }
  let(:events_speaker) { FactoryBot.create :spina_events_speaker }
  let(:speaker_attributes) { FactoryBot.attributes_for :spina_events_speaker }

  routes { Spina::Engine.routes }

  context 'signed in as an admin' do
    before { sign_in }

    describe 'GET #index' do
      subject { get :index }

      it { is_expected.to have_http_status :success }
      it { is_expected.to render_template :index }
      it {
        subject
        expect(assigns(:speakers)).to match_array speakers
      }
    end

    describe 'GET #new' do
      subject { get :new }

      it { is_expected.to have_http_status :success }
      it { is_expected.to render_template :new }
    end

    describe 'POST #create' do
      subject { post :create, params: { speaker: speaker_attributes } }

      it { is_expected.to have_http_status :redirect }
      it {
        subject
        expect(flash[:notice]).to eq 'Speaker saved'
      }
      it { expect{subject}.to change(Spina::Events::Speaker, :count).by(1) }

      context 'with invalid attributes' do
        subject { post :create, params: { speaker: { content: 'foo' } } }

        it { is_expected.to_not have_http_status :redirect }
        it { expect{subject}.to_not change(Spina::Events::Speaker, :count) }
        it { is_expected.to render_template :new }
      end
    end

    describe 'GET #edit' do
      subject { get :edit, params: { id: events_speaker.id } }

      it { is_expected.to have_http_status :success }
      it { is_expected.to render_template :edit }
    end

    describe 'PATCH #update' do
      subject { patch :update, params: { id: events_speaker.id, speaker: speaker_attributes } }

      it { is_expected.to have_http_status :redirect }
      it {
        subject
        expect(flash[:notice]).to eq 'Speaker saved'
      }
      it { expect{subject}.to change{events_speaker.reload.name} }

      context 'with invalid attributes' do
        subject { patch :update, params: { id: events_speaker.id, speaker: { name: '' } } }

        it { is_expected.to_not have_http_status :redirect }
        it { is_expected.to render_template :edit }
        it { expect{subject}.to_not change{events_speaker.reload.name} }
      end
    end

    describe 'DELETE #destroy' do
      let!(:events_speaker) { FactoryBot.create :spina_events_speaker }

      subject { delete :destroy, params: { id: events_speaker.id } }

      it { expect{subject}.to change(Spina::Events::Speaker, :count).by(-1) }
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
