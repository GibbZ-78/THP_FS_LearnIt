Rails.application.routes.draw do
root to: 'static_pages#home'

  devise_for :users
  
  scope "/dashboard" do
    get "admin", to: "dashboard#admin", as: "dashboard_admin"
    get "student", to: "dashboard#student", as: "dashboard_student"
  end
  
  resources :dashboard, :themes, :chapters, :courses, :quizzes, :question_answers, :groups, :seasons, :memberships, :user_theme_seasons

  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'fees', to: 'static_pages#fees'
  post 'contact', to: 'static_pages#contact_form', as: 'contact_form'

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    get "success", to: "checkout#success", as: "checkout_success"
  end

end
