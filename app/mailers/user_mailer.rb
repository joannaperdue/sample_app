class UserMailer < ApplicationMailer

  default from: "admin@bikeberlincentral.com"
    def new_registration(user)
      @user = user
      mail(:to => user.email, :subject => "Welcome to Bike Berlin Central!")
    end


  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'joanna.perdue@verizon.net',
         subject: "A new contact form message from #{name}")
  end

  def order_notification(user,order)
    @appname = "Bike Berlin Central"
    @user = user
    mail(to: user.email, subject: "Your order at #{@appname}")
  end
end
