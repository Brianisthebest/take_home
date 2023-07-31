require 'rails_helper'

RSpec.describe 'GET /api/v0/customers/:id/subscriptions', type: :request do
  describe 'happy path' do
    it 'returns all subscriptions associated to user' do
      customer = create(:customer)
      tea_1 = create(:tea)
      tea_2 = create(:tea)
      subscription_1 = create(:subscription, customer_id: customer.id, tea_id: tea_1.id)
      subscription_2 = create(:subscription, customer_id: customer.id, tea_id: tea_2.id)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      get "/api/v0/customers/#{customer.id}/subscriptions", headers: headers

      json = JSON.parse(response.body, symbolize_names: true)
require 'pry'; binding.pry
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json[:data].count).to eq(2)
      expect(json[:data][0][:id]).to eq(subscription_1.id.to_s)
      expect(json[:data][0][:type]).to eq('subscription')
      expect(json[:data][0][:attributes][:customer_id]).to eq(subscription_1.customer_id)
      expect(json[:data][0][:attributes][:tea_id]).to eq(subscription_1.tea_id)
      expect(json[:data][0][:attributes][:title]).to eq(subscription_1.title)
      expect(json[:data][0][:attributes][:price]).to eq(subscription_1.price)
      expect(json[:data][0][:attributes][:status]).to eq(subscription_1.status)
      expect(json[:data][0][:attributes][:frequency]).to eq(subscription_1.frequency)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json[:data].count).to eq(2)
      expect(json[:data][1][:id]).to eq(subscription_2.id.to_s)
      expect(json[:data][1][:type]).to eq('subscription')
      expect(json[:data][1][:attributes][:customer_id]).to eq(subscription_2.customer_id)
      expect(json[:data][1][:attributes][:tea_id]).to eq(subscription_2.tea_id)
      expect(json[:data][1][:attributes][:title]).to eq(subscription_2.title)
      expect(json[:data][1][:attributes][:price]).to eq(subscription_2.price)
      expect(json[:data][1][:attributes][:status]).to eq(subscription_2.status)
      expect(json[:data][1][:attributes][:frequency]).to eq(subscription_2.frequency)
    end
  end

  describe 'sad path' do
    it 'returns an error if no customer exists' do
      headers = { 'CONTENT_TYPE' => 'application/json' }

      get "/api/v0/customers/5/subscriptions", headers: headers

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(json[:errors]).to eq("Couldn't find Customer with id 5")
    end
  end
end