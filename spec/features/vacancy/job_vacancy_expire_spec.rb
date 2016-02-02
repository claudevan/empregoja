require 'rails_helper'

feature 'Vacancy expire in 90 days' do
  scenario 'not show expired jobs' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.new(title: 'Dev Master',
                  location: 'Rio de Janeiro',
                  category: category,
                  company: company,
                  description: 'Vaga para Dev Master para Bootcamp Rails')

    travel_to 90.days.ago do
      job.save
    end

    visit root_path

    expect(page).not_to have_content job.title
  end

  scenario 'Show recently jobs' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Programador',
                     location: 'Rio de Janeiro',
                     category: category,
                     company: company,
                     description: 'Vaga para Dev Master para Bootcamp Rails')

    visit root_path

    expect(page).to have_content job.title
  end

  scenario 'Visit a expired job' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.new(title: 'Dev Master',
                  location: 'Rio de Janeiro',
                  category: category,
                  company: company,
                  description: 'Vaga para Dev Master para Bootcamp Rails')

    travel_to 90.days.ago do
      job.save
    end

    visit job_path(job)

    expect(page).to have_content job.title
    expect(page).to have_content 'Vaga Expirada'
  end
end
