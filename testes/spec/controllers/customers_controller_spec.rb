require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as a guest' do
    context '#index' do
      it 'index' do
        get :index

        expect(response).to be_success
      end

      it 'index http status' do
        get :index

        expect(response).to have_http_status('200')
      end
    end

    context '#show' do
      it 'unauthorized' do
        create(:customer)
        get :show, params: { id: Customer.first }

        expect(response).to have_http_status('302')
      end
    end
  end

  describe 'Logged' do
    let(:customer) { create(:customer) }

    before do
      member = create(:member)

      sign_in member
    end

    it 'Index route' do
      is_expected.to route(:get, '/customers').to(action: :index)
    end

    context '#create' do
      it 'with valid params' do
        customer_params = attributes_for(:customer)

        puts customer_params

        expect {
          post :create, params: { customer: customer_params }
        }.to change(Customer, :count).by(1)
      end

      it 'with invalid params' do
        customer_params = attributes_for(:customer, address: nil)

        expect {
          post :create, params: { customer: customer_params }
        }.not_to change(Customer, :count)
      end

      it 'responds with success' do
        customer_params = attributes_for(:customer)

        post :create, params: { customer: customer_params }

        expect(flash[:notice]).to match(/successfully created/)
      end
    end

    context '#show' do
      it 'authorized' do
        get :show, params: { id: customer }

        expect(response).to have_http_status('200')
      end

      it 'Testa content type json' do
        get :show, format: :json, params: { id: customer.id }

        expect(response.content_type).to eq('application/json')
      end

      it 'render a :show template' do
        get :show, params: { id: customer }

        expect(response).to render_template(:show)
      end
    end
  end
end
