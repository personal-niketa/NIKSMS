class CustomerMailer < ApplicationMailer
  default from: ENV['GMAIL_ID']

  def welcome_mail(customer_email)
    @cus_email = customer_email
    mail(to: @cus_email, subject: "Welcome Email")
  end

end
