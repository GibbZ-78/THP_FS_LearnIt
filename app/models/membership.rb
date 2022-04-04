class Membership < ApplicationRecord
  belongs_to :user

  # ActionMailer callback after "Membership" creation to:
  # - send a "welcome message" to the Student
  # - inform the Admin a new Student as subscribe a yearly membership
  after_create :membership_send
  after_create :admin_send

  def membership_send
    UserMailer.membership_email(self).deliver_now
  end

  def admin_send
    UserMailer.admin_email(self).deliver_now
  end
  
end
