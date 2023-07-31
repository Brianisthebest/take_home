class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title, :price, :status, :frequency

  def change_status_to_cancelled
    update(status: 'Cancelled')
  end
end
