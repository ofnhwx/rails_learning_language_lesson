Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root 'teachers#index'
    resources :teachers, except: :show
  end

  devise_for :teacher, controllers: {
    sessions: 'teacher/sessions'
  }
  namespace :teacher do
    root 'lessons#index'
    resource :profile, only: %i[show edit update]
    resources :lessons
  end

  devise_for :user
end
