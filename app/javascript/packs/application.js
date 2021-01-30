import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import 'bootstrap';
import '../src/application.scss';
import '../src/stripe_checkout.js';
