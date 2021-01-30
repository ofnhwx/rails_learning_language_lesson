import {loadStripe} from '@stripe/stripe-js';

document.addEventListener('turbolinks:load', () => {
  const checkoutButtons = document.getElementsByClassName('checkout-button');
  Array.prototype.forEach.call(checkoutButtons, button => {
    button.addEventListener('click', () => {
      checkout(button.dataset.checkoutPath);
    });
  });
});

const checkout = async checkoutPath => {
  const stripe = await loadStripe(document.getElementById('stripe-publishable-key').dataset.value);
  const response = await fetch(checkoutPath, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
    }
  });
  const session = await response.json();
  await stripe.redirectToCheckout({ sessionId: session.id });
};
