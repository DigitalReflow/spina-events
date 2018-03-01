require 'rails_helper'

RSpec.feature "Admin Speaker", type: :feature do

  describe 'listing speakers' do
    let!(:speakers) { FactoryBot.create_list :spina_events_speaker, 3 }
    before { sign_in }

    it 'shows all the speakers' do
      visit '/admin/events/speakers'
      expect(page).to have_css 'ol li', count: 3
    end
  end
end
