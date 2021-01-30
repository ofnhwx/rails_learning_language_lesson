Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :admins
  namespace :admins do
    root 'teachers#index'
    resources :teachers, except: :show
  end

  devise_for :teachers
  namespace :teachers do
    root 'lessons#index'
    resource :profile, only: %i[show edit update]
    resources :lessons
  end

  devise_for :users
end
