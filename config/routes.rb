Rails.application.routes.draw do
  root to: 'static_pages#home'
  devise_for :users
  get 'uikit', to: 'static_pages#uikit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :themes
  resources :chapters
  resources :courses
  resources :quizes
  resources :question_answers
end
