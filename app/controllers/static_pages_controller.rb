class StaticPagesController < ApplicationController
  
  def home
    @future_seasons_themes = Season.where("start_date > ?", Date.today).all
    
    if user_signed_in?
      if current_user.what_role? == "student"
        membership = Membership.where(user_id:current_user.id).last 
        if !membership.nil?
          if membership.subscription_date >= Time.now() - 365.days
            @go_stripe = false
          else
            @go_stripe = true
          end
        else
          @go_stripe = true
        end
      else
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

  def contact_form
    clean_params= params.permit(:first_name, :last_name, :email, :object, :message)
    UserMailer.contact_email(params[:first_name], params[:last_name], params[:email], params[:object], params[:message]).deliver_now
    redirect_to contact_path
  end
end
