require 'rails_helper'

feature 'User edits a company' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             phone:    '2369-3476',
                             mail:     'contato@campuscode.com.br')

    user = User.create(email:'fulano@email.com', password:'123_ate_mil')
    login_as(user, scope: :user)

    visit edit_company_path(company)

    fill_in 'Name',     with: 'Code Campus'
    fill_in 'Location', with: 'Recife'
    fill_in 'Mail',     with: 'contat@codecampus.com.br'
    fill_in 'Phone',    with: '1111-5555'

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Code Campus'
    expect(page).to have_content 'Recife'
    expect(page).to have_content 'contat@codecampus.com.br'
    expect(page).to have_content '1111-5555'
  end

  scenario 'and visit new user page if visitor are not authenticated' do
      company = Company.create(name:     'Campus Code',
                               location: 'São Paulo',
                               phone:    '2369-3476',
                               mail:     'contato@campuscode.com.br')

      visit edit_company_path company

      expect(page).to have_current_path(new_user_session_path)
  end
end
