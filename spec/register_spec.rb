require 'rails_helper'

RSpec.feature 'Registrieren',
              'Als ein "User",
               will Ich mich einlogen können
               um meine Einkäufe verwalten zu können' do
  context 'Auf Startseite' do
    scenario 'Registrieren' do
      visit root_path

      click_link 'Registrieren'
      fill_in 'E-Mail', with: 'Kappa@rails-experts.com'
      fill_in 'Passwort', with: 'Kappa123'
      fill_in 'Passwort bestätigen', with: 'Kappa123'

      expect { click_button 'Registrieren' }.to change {User.count}.by(1)
      expect(page).to have_content 'kappa@rails-experts.com'
    end
  end
end

