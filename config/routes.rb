Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  devise_for :users

  resources :themes
  resources :chapters
  resources :courses
  resources :quizes
  resources :question_answers
  resources :groups
  resources :seasons
  resources :memberships

  get 'uikit', to: 'static_pages#uikit'
end
