class StaticPagesController < ApplicationController
  
  #To be checked
  def home
    if user_signed_in?
      if user.role <= 1
        if membership != nil
          if membership.timestamps < datetime.now - 365
            <%= link_to checkout_create_path %>
          else 
            <%= link_to dashboard_path %>
          end
        else
          <%= link_to checkout_create_path %>
        end
      else
        <%= link_to dashboard_path %>
      end
    else
      <%= link_to 'Login', ... %> #substitute the ... for whatever path goes to login
    end
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
