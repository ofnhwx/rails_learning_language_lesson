Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :teacher, controllers: {
    sessions: 'teacher/sessions'
  }
  devise_for :user

  root 'lessons#index'
  resources :lessons, only: :index do
    collection do
      get :reserved
    end
    resource :reservation, only: :create
  end
  resources :products, only: :index do
    resource :checkout, only: :new do
      member do
        get :success
        get :cancel
      end
    end
  end

  namespace :admin do
    root 'teachers#index'
    resources :teachers, except: :show
  end

  namespace :teacher do
    root 'lessons#index'
    resource :profile, only: %i[edit update]
    resources :lessons
  end

  namespace :stripe do
    mount StripeEvent::Engine, at: 'webhook'
  end
end
