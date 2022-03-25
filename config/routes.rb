Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users
  resources :dashboard
  
  resources :themes
  resources :chapters
  resources :courses
  resources :quizzes
  resources :question_answers
  resources :groups
  resources :seasons
  resources :memberships
  resources :static_pages

  get 'uikit', to: 'static_pages#uikit'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'fees', to: 'static_pages#fees'

end
