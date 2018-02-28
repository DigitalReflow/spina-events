require 'rails_helper'

RSpec.feature "Admin Organisations", type: :feature do

  describe 'listing organisations' do
    let!(:organisations) { FactoryBot.create_list :spina_events_organisation, 3 }
    before { sign_in }

    it 'shows all the organisations' do
      visit '/admin/events/organisations'
      expect(page).to have_css 'ol li', count: 3
    end
  end
end
