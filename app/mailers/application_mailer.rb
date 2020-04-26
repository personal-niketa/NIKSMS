class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_ID']
  layout 'mailer'
end
