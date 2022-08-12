# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "<verification-noreply@tori-kichi.com>"
  layout "mailer"
end
