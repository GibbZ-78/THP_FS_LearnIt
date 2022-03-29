class Membership < ApplicationRecord
  belongs_to :user

  #ActionMailer callback after "Order" creation to send the User an email with its kitten picture 

  after_create :membership_send

  def membership_send
    UserMailer.membership_email(self).deliver_now
  end

  after_create :admin_send

  def admin_send
    UserMailer.admin_email(self).deliver_now
  end
  
end
