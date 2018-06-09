class UserMailer < ApplicationMailer
  @message = message
    mail(from: email,
         to: 'your-email@example.com',
         subject: "A new contact form message from #{name}")
  end
end
