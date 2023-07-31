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
      json = JSON.parse(@response.body, symbolize_names: true)

      expect(json).to be_successful
      expect(json.status).to eq(201)
      expect(json[:data][:id]).to eq(created_subscription.id.to_s)
      expect(json[:data][:type]).to eq('subscriptions')
      expect(json[:data][:attributes][:customer_id]).to eq(created_subscription.customer_id)
      expect(json[:data][:attributes][:tea_id]).to eq(created_subscription.tea_id)
      expect(json[:data][:attributes][:title]).to eq(created_subscription.title)
      expect(json[:data][:attributes][:price]).to eq(created_subscription.price)
      expect(json[:data][:attributes][:status]).to eq(created_subscription.status)
      expect(json[:data][:attributes][:frequency]).to eq(created_subscription.frequency)
    end
  end
end