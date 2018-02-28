require 'rails_helper'

RSpec.feature "Admin Venues", type: :feature do

  describe 'listing venues' do
    let!(:venues) { FactoryBot.create_list :spina_events_venue, 3 }
    before { sign_in }

    it 'shows all the venues' do
      visit '/admin/events/venues'
      expect(page).to have_css 'ol li', count: 3
    end
  end
end
