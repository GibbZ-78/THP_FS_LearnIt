class CheckoutController < ApplicationController

  # Instantiating STRIPE payment funnel
  def create
    puts "INFO - Stripe - Starting payment funnel"
    @user = current_user
    puts "  > User: #{@user.email} #{@user.role} (user ID: #{@user.id})" #first_name and last_name
    @total = 399.00
    puts "  > Total amount: #{@total}"
    puts "  > Success URL: #{checkout_success_url} (eq. #{checkout_success_path})"
    puts "  > Cancel URL: #{checkout_cancel_url} (eq. #{checkout_cancel_path})"

    # Creating a dedicated "session" Stripe object using the above "payment_method"
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      # payment_method: @payment_method,
      line_items: [
        {
          name: "Learnit Payment of #{@user.email} #{@user.role}", #first_name and last_name
          amount: (@total*100).to_i,
          currency: "eur",
          quantity: 1
        },
      ],
      # payment_intent: @payment_intent, #success => dashboard student
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      #mode: "payment",
    )

    respond_to do |format|
      format.js   # Render views/checkout/create.js.erb
    end
    puts "INFO - Stripe - Closing payment funnel"
  end

  # Error encountered hence suppressing STRIPE payment tunnel
  def cancel
    puts "INFO - Stripe - Starting 'cancel' method"
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    puts "INFO - Stripe - Closing 'cancel' method"
  end

  # Went through STRIPE payment tunnel sucessfully
  def success
    puts "INFO - Stripe - Starting 'success' method"
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    # Manageing "Order" object creation from current_user's "Cart"
    @my_user = current_user
    @my_membership = Membership.create(user_id: @my_user.id, order_date: Date.today, comment:"Created from membership nr. #{@my_membership.id} of #{@my_user.first_name} #{@my_user.last_name}", payment_method: "Card over Stripe")
    puts "... Done"
  
    redirect_to dashboard_index_path

    puts "INFO - Stripe - Closing 'success' method"
  end

end