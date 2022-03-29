class ApplicationMailer < ActionMailer::Base
  default from: 'jb.vidal@gmail.com'    # Updated this one too with my mail, should it be the cause of the 550 ERROR
  layout 'mailer'
end
