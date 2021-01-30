class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true

  has_many :tickets

  validates :caption, presence: true
  validates :price, presence: true

  def self.complete_checkout(stripe_session_id)
    order = Order.find_by!(stripe_session_id: stripe_session_id)
    Order.transaction do
      order.update!(completed_at: DateTime.current)
      order.product.amount.times do
        order.tickets.create!
      end
    end
  end
end
