class ApplicationMailer < ActionMailer::Base
  default from: ENV['secret_email_base']
  layout 'mailer'
end
