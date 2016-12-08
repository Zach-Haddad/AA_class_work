class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def welcome_email
   @url  = 'http://example.com/login'
   mail(to: 'everybody@appacademy.io', subject: 'Welcome to My Awesome Site')
 end
end
