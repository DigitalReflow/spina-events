require 'rails_helper'

RSpec.feature "Conferences", type: :feature do
  let!(:account) { ::Spina::Account.create name: 'MySite', theme: 'default' }

  describe 'listing conferences' do
    let!(:conferences) { FactoryBot.create_list :spina_events_conference, 3, draft: false }

    it 'shows all the conferences' do
      visit '/conferences'
      expect(page).to have_css 'li.conference', count: 3
    end
  end

  describe 'showing a conference' do
    let!(:conference) { FactoryBot.create :spina_events_conference }

    it 'shows the conference' do
      visit "/conferences/#{conference.slug}"
      expect(page).to have_css 'h1', text: conference.title
      expect(page).to have_content conference.description
    end
  end
end
