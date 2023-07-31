class Api::V0::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  def create
    @subscription = Subscription.create!(subscription_params)
    render json: SubscriptionSerializer.new(@subscription), status: 201
  end
  
  def render_invalid_response(error)
    render json: { errors: error.message }, status: 400
  end

  private
  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end