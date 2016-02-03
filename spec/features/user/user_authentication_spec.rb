require 'rails_helper'

feature 'User Authentication' do
  scenario 'Log In' do
    user = User.create(email:'fulano@email.com', password:'123_ate_mil')
    login_as(user, scope: :user)

    visit root_path

    expect(page).to have_content "Bem Vindo: #{user.email}"
    expect(page).to have_content "Sair"
  end

  scenario 'Log Out' do
    user = User.create(email:'fulano@email.com', password:'123_ate_mil')
    login_as(user, scope: :user)

    visit root_path

    click_on 'Sair'

    expect(page).not_to have_content "Sair"
    expect(page).to have_content "Entrar"
  end
end
