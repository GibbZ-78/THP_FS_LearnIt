class StaticPagesController < ApplicationController
  
  #To be checked
  def home
    if user_signed_in?
      if user.role <= 1
        membership = Membership.where(user_id:current_user.id).last
        if membership != nil
          if membership.subscription_date >= datetime.now() - 365.days
            redirect_to dashboard_index_path, method: "get"
          else
            redirect_to checkout_create_path, method: "post"
          end
        else
          redirect_to new_user_registration_path, method: "get"
        end
      else
        redirect_to dashboard_index_path, method: "get"
      end
    end # If not logged in, does nothing
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
