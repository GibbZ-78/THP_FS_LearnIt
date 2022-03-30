class ApplicationController < ActionController::Base

# Invoking DEVISE to benefit from "user_signed_in?" and "current_user" helpers
before_action Devise::authenticate_user!

def self.stripe_after_sign_in
  #if user_signed_in?
    if current_user.role == 0
      membership = Membership.where(user_id:current_user.id).last 
      if !membership.nil?
        if membership.subscription_date >= datetime.now() - 365.days
          #redirect_to dashboard_index_path, method: "get"
          get '/dashboard' => 'dashboard#index', as: :user_root
        else
          post '/checkout/create', to: 'checkout#create', as: :user_root #puts the STRIPE checkout path into the "user_root_path"
        end
      else
        post '/checkout/create', to: 'checkout#create', as: :user_root #puts the STRIPE checkout path into the "user_root_path"
      end
    else
      #redirect_to dashboard_index_path, method: "get" 
      get '/dashboard' => 'dashboard#index', as: :user_root
    end
  #end #If not logged in, does nothing
end

stripe_after_sign_in
end