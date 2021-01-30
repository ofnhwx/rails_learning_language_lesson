class CheckoutsController < ApplicationController
  before_action :set_product

  def new
    checkout_session = Stripe::Checkout::Session.create(
      payment_method_types: %w[card],
      line_items: [
        {
          price_data: {
            currency: 'jpy',
            product_data: { name: @product.name },
            unit_amount: @product.price_with_tax
          },
          quantity: 1
        }
      ],
      mode: 'payment',
      payment_intent_data: {
        metadata: { product_id: @product.id }
      },
      success_url: success_product_checkout_url(@product),
      cancel_url: cancel_product_checkout_url(@product)
    )

    current_user.orders.create!(
      user: current_user,
      product: @product,
      caption: @product.name,
      price: @product.price_with_tax,
      stripe_session_id: checkout_session.id
    )

    render json: { id: checkout_session.id }
  end

  def success
    redirect_to products_path, notice: 'チケットの購入しました'
  end

  def cancel
    redirect_to products_path, notice: 'チケットの購入をキャンセルしました'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
