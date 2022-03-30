Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users
  
  # JBV - Adding specific routes for dashboards' management
  scope "/dashboard" do
    get "admin", to: "dashboard#admin", as: "dashboard_admin"   # JBV - Specific route for the ADMIN dashboard
    get "student", to: "dashboard#student", as: "dashboard_student"
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
  resources :user_theme_seasons   # JBV - To be digged up if we need to create all standard routes when "new/create" will be mainly used...?

  get 'uikit', to: 'static_pages#uikit'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'fees', to: 'static_pages#fees'

# 28.03.2022 - Adding STRIPE dedicated routes
scope "/checkout" do
  post "create", to: "checkout#create", as: "checkout_create"
  get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  get "success", to: "checkout#success", as: "checkout_success"
end

end
