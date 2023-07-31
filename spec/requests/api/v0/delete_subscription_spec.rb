require 'rails_helper'

RSpec.describe 'DELETE /api/v0/subscriptions/:id', type: :request do
  describe 'happy path' do
    it 'changes the subscription to cancelled' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = create(:subscription, customer_id: customer.id, tea_id: tea.id)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      delete "/api/v0/subscriptions/#{subscription.id}", headers: headers
      
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json[:data][:id]).to eq(subscription.id.to_s)
      expect(json[:data][:type]).to eq('subscription')
      expect(json[:data][:attributes][:customer_id]).to eq(subscription.customer_id)
      expect(json[:data][:attributes][:tea_id]).to eq(subscription.tea_id)
      expect(json[:data][:attributes][:title]).to eq(subscription.title)
      expect(json[:data][:attributes][:price]).to eq(subscription.price)
      expect(json[:data][:attributes][:status]).to eq('Cancelled')
      expect(json[:data][:attributes][:frequency]).to eq(subscription.frequency)
    end

    it 'returns an error if no subscription exists with that id' do
      headers = { 'CONTENT_TYPE' => 'application/json' }

      delete "/api/v0/subscriptions/5", headers: headers
      
      json = JSON.parse(response.body, symbolize_names: true)

      require 'pry'; binding.pry
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(json[:errors]).to eq("Couldn't find Subscription with 'id'=5")
    end
  end
end