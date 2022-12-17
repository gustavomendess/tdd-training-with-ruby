require 'rails_helper'

RSpec.describe "Customers", type: :request do
  it "index - multiple resources" do
    get '/customers.json'

    expect(response.body).to include_json([
                                            id: /\d/,
                                            name: (be_kind_of String),
                                            email: (be_kind_of String)
                                          ])
  end

  it "show - only resource" do
    get "/customers/1.json"

    expect(response.body).to include_json(
                               id: /\d/,
                               name: (be_kind_of String),
                               email: (be_kind_of String)
                             )
  end

  it "show with parsed response" do
    get "/customers/1.json"

    response_body = JSON.parse(response.body)

    expect(response_body.fetch('id')).to eq(1)
  end

  it "create - json" do
    member = create(:member)
    login_as(member, scope: :member)

    headers = { 'ACCEPT' => 'application/json' }
    customer_params = attributes_for(:customer)

    post '/customers.json', params: { customer: customer_params }, headers: headers

    expect(response.body).to include_json(
                               id: /\d/,
                               name: customer_params[:name],
                               email: customer_params[:email]
                             )
  end

  it "update - json" do
    member = create(:member)
    login_as(member, scope: :member)

    headers = { 'ACCEPT' => 'application/json' }

    customer = Customer.first
    customer.name += ' - Atualizado'

    patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers

    expect(response.body).to include_json(
                               name: customer.name
                             )
  end

  it "destroy - json" do
    member = create(:member)
    headers = { 'ACCEPT' => 'application/json' }
    customer = Customer.first

    login_as(member, scope: :member)



    expect{
      delete "/customers/#{customer.id}.json",
             params: { customer: customer.attributes },
             headers: headers
    }.to change(Customer, :count).by(-1)
  end
end
