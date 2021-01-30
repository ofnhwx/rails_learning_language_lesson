Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :admins
  namespace :admins do
    root 'teachers#index'
    resources :teachers, except: :show
  end

  devise_for :teachers

  devise_for :users
end
