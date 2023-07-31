class Api::V0::Customers::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_invalid_response
  before_action :set_customer

  def index
    render json: SubscriptionSerializer.new(@customer.subscriptions)
  end

  def render_invalid_response
    render json: { errors: "Couldn't find Customer with id #{params[:customer_id]}" }, status: 400
  end

  def set_customer
    @customer = Customer.find_by_id!(params[:customer_id])
  end
end