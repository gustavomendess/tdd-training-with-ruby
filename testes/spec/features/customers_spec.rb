require 'rails_helper'

RSpec.feature "Customers", type: :feature, js: true do
  it 'visit customers page' do
    visit(customers_path)

    expect(page).to have_current_path(customers_path)
  end

  it 'visit customers page' do
    member = create(:member)
    login_as(member, scope: :member)

    visit(new_customer_path)

    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('address', with: Faker::Address.street_address)

    click_button('Create Customer')

    expect(page).to have_content('Customer was successfully created.')
  end
end
