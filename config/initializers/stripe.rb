Rails.configuration.stripe = {
  publishable_key: ENV.fetch('STRIPE_PUBLISHABLE_KEY'),
  secret_key: ENV.fetch('STRIPE_SECRET_KEY'),
  signing_secret: ENV.fetch('STRIPE_SIGNING_SECRET')
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed' do |event|
    Order.complete_checkout(event.data.object.id)
  end
end
