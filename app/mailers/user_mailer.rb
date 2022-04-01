class UserMailer < ApplicationMailer
  
  default from: 'jb.vidal@gmail.com'
 
  def membership_email(membership)
    @user = membership.user 
    @membership = membership
    @url  = 'https://welearnit.herokuapp.com/' 
    mail(to: @user.email, subject: 'Votre inscription chez LearnIt!') 
  end

  def admin_email(membership)
    @user = membership.user
    @membership = membership
    mail(to: "learnit_admin@yopmail.com", subject: 'Nouvelle inscription sur LearnIt!')
  end

  def contact_email(myfirstname,mylastname,myemail,myobject,mymessage)
    @myfirstname = myfirstname
    @mylastname = mylastname
    @myemail = myemail
    @myobject = myobject
    @mymessage = mymessage
    mail(to: "learnit_admin@yopmail.com", subject: @myobject)
  end
  
end