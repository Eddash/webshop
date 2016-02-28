module AcceptanceTestHelper
  def sign_in(user)
    visit root_path  
    click_link 'Anmelden' 
    fill_in 'E-Mail', with: user.email 
    fill_in 'Passwort', with: 'Kappa123'   
    click_button 'Anmelden'
  end
end