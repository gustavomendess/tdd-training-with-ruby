require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem um customer vinculado corretamente' do
    order = create(:order)

    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Cria uma lista de pedidos' do
    orders = create_list(:order, 5)

    expect(orders.size).to eq(5)
  end

  it 'Has many with default transient' do
    customer = create(:customer, :with_orders)

    expect(customer.orders.size).to eq(3)
  end

  it 'Has many with five orders' do
    customer = create(:customer, :with_orders, quantity_orders: 5)

    expect(customer.orders.size).to eq(5)
  end
end
