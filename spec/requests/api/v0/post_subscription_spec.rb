require 'rails_helper'

RSpec.describe 'POST /api/v0/subscriptions', type: :request do
  describe 'happy path' do
    it 'creates a subscription' do
      customer = create(:customer)
      tea = create(:tea)
      subscription_params = {
        'customer_id':  "#{customer.id}",
        'tea_id': "#{tea.id}",
        'title': 'Tea Subscription',
        'price': '15.00',
        'status': 'Active',
        'frequency': 'Monthly'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/subscriptions', headers: headers, params: JSON.generate(subscription_params)

      created_subscription = Subscription.last
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(json[:data][:id]).to eq(created_subscription.id.to_s)
      expect(json[:data][:type]).to eq('subscription')
      expect(json[:data][:attributes][:customer_id]).to eq(created_subscription.customer_id)
      expect(json[:data][:attributes][:tea_id]).to eq(created_subscription.tea_id)
      expect(json[:data][:attributes][:title]).to eq(created_subscription.title)
      expect(json[:data][:attributes][:price]).to eq(created_subscription.price)
      expect(json[:data][:attributes][:status]).to eq(created_subscription.status)
      expect(json[:data][:attributes][:frequency]).to eq(created_subscription.frequency)
    end
  end

  describe 'sad path' do
    it 'returns an error if missing frequency' do
      customer = create(:customer)
      tea = create(:tea)
      subscription_params = {
        'customer_id':  "#{customer.id}",
        'tea_id': "#{tea.id}",
        'title': 'Tea Subscription',
        'price': '15.00',
        'status': 'Active'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/subscriptions', headers: headers, params: JSON.generate(subscription_params)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(json[:errors]).to eq("Validation failed: Frequency can't be blank")
    end

    it 'returns an error if missing customer_id or tea_id' do
      subscription_params = {
        'title': 'Tea Subscription',
        'price': '15.00',
        'status': 'Active',
        'frequency': 'Monthly'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/subscriptions', headers: headers, params: JSON.generate(subscription_params)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(json[:errors]).to eq("Validation failed: Customer must exist, Tea must exist")
    end
  end
end