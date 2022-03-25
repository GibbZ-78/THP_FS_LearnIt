Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  devise_for :users

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
  get 'contact', to: 'static_pages#contact'
end
