require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships and validations' do
    it { should belong_to :customer }
    it { should belong_to :tea }
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency }
  end

  describe 'instance methods' do
    describe 'change_status_to_cancelled' do
      it 'changes the status of the subscription to cancelled' do
        customer = create(:customer)
        tea = create(:tea)
        subscription = create(:subscription, status: 'Active', customer_id: customer.id, tea_id: tea.id)

        expect(subscription.status).to eq('Active')
        subscription.change_status_to_cancelled
        expect(subscription.status).to eq('Cancelled')
      end
    end
  end
end