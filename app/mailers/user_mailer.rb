class UserMailer < ApplicationMailer
  def welcome (current_user)
    unless current_user.nil?
      mail(
        :from => "bikeberlincentral.com",
        :to => current_user.email,
        :subject => "Thank you for signing up."
      )
    else
      mail(
        :from => "bikeberlincentral.com",
        :to => "test@mail.com",
        :subject => "Thank you for signing up."
      )
    end
  end
