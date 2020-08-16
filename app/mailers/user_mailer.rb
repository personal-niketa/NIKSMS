class UserMailer < ApplicationMailer
  default from: ENV['GMAIL_ID']

  def welcome_email(school_email)
  	@email = school_email
    mail(to: @email, subject: "Notification")
  end


end
