require 'rails_helper'

feature 'User Log in' do
  scenario 'successfully' do
    user = User.create(email:'fulano@email.com', password:'123_ate_mil')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: 'fulano@email.com'
    fill_in 'Password', with: '123_ate_mil'

    click_on 'Log in'

    expect(page).to have_content "Bem Vindo: #{user.email}"
  end
end
