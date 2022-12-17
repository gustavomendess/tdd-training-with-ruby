require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Create default customer' do
    customer = create(:customer)

    expect(customer.vip).to be_falsey
  end

  it 'Create vip customer' do
    customer = create(:customer_vip)

    expect(customer.vip).to be_truthy
  end

  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }

  it 'Transient attribute' do
    customer = create(:customer, upcased: true)

    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Male Customer' do
    customer = create(:customer, :male)

    expect(customer.gender).to eq('M')
  end

  it 'Female Customer' do
    customer = create(:customer, :female)

    expect(customer.gender).to eq('F')
  end
end
