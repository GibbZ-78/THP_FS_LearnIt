class StaticPagesController < ApplicationController
  #before_action :authenticate_user!
  
  def home
    if user_signed_in?
      if current_user.what_role? == "student"
        membership = Membership.where(user_id:current_user.id).last 
        if !membership.nil?
          if membership.subscription_date >= Time.now() - 365.days
            #redirect_to dashboard_index_path, method: "get"
            #get '/dashboard' => 'dashboard#index', as: :user_root
            @go_stripe = false
          else
            #post '/checkout/create', to: 'checkout#create', as: :user_root #puts the STRIPE checkout path into the "user_root_path"
            @go_stripe = true
          end
        else
          #post '/checkout/create', to: 'checkout#create', as: :user_root #puts the STRIPE checkout path into the "user_root_path"
          @go_stripe = true
        end
      else
        #redirect_to dashboard_index_path, method: "get" 
        #get '/dashboard' => 'dashboard#index', as: :user_root
        @go_stripe = false
      end
    else
      @go_stripe = false
    end #If not logged in, does nothing
  end
  
  def uikit
  end

  def about
  end

  def contact
  end

  def fees
  end

end
