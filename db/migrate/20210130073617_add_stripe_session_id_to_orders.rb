class AddStripeSessionIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :stripe_session_id, :string
    add_index :orders, :stripe_session_id, unique: true

    add_column :orders, :completed_at, :datetime
  end
end
