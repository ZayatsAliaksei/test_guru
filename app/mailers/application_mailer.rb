class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" test@guru.com  }
  layout 'mailer'
end
