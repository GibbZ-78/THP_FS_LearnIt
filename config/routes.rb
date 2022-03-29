Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users
  
  # JBV - Adding specific routes for dashboards' management
  scope "/dashboard" do
    get "admin", to: "dashboard#admin", as: "dashboard_admin"   # JBV - Specific route for the ADMIN dashboard
  end
  
  resources :dashboard  # JBV - Not sure it is useful to keep this as we call only non-standard methods from this controller...?
  
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
