class Api::V0::Customers::SubscriptionsController < ApplicationController
  def index
    @customer = Customer.find_by_id(params[:customer_id])
    render json: SubscriptionSerializer.new(@customer.subscriptions)
  end
end