require 'rails_helper'

RSpec.feature "Admin Conferences", type: :feature do

  describe 'listing conferences' do
    let!(:conferences) { FactoryBot.create_list :spina_events_conference, 3 }
    before { sign_in }

    it 'shows all the conferences' do
      visit '/admin/events/conferences'
      expect(page).to have_css 'tbody tr', count: 3
    end
  end
end
