require 'rails_helper'

RSpec.feature 'Anmelden',
              'Als registrierter "User",
               will ich mich einloggen und
               meinen Einkäufe verwalten können' do

  context 'Auf Startseite' do
    let(:user) {FactoryGirl.create(:user)}

    scenario 'Anmelden' do
      visit root_path

      click_link 'Anmelden'
      fill_in 'Email', with: user.email
      fill_in 'Passwort', with: 'Kappa123'

      click_button 'Anmelden'

      expect(page).to have_content "#{user.email}"
    end

    scenario 'Abmelden' do
      visit root_path

      click_link 'Anmelden'
      fill_in 'Email', with: user.email
      fill_in 'Passwort', with: 'Kappa123'

      click_button 'Anmelden'
      click_link 'Abmelden'

      expect(page).to_not have_content "#{user.email}"
      expect(page).to have_content 'Anmelden'
    end

  end
end

