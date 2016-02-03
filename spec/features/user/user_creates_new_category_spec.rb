require 'rails_helper'

feature 'User creates a new category' do
  scenario 'successfully' do
    category = Category.new(name: 'Desenvolvedor')

    user = User.create(email:'fulano@email.com', password:'123_ate_mil')
    login_as(user, scope: :user)

    visit new_category_path

    fill_in 'Name', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content category.name
  end

  scenario 'invalid' do
    user = User.create(email:'fulano@email.com', password:'123_ate_mil')
    login_as(user, scope: :user)
    
    visit new_category_path
    click_on 'Criar Categoria'

    expect(page).to have_content 'Warning! All fields are mandatory.'
  end

  scenario 'and visit new user page if visitor are not authenticated' do
      visit new_category_path

      expect(page).to have_current_path(new_user_session_path)
  end
end
