class NotificationMailer < ApplicationMailer
  default from: 'info@flight.com'
  def notification_mailer(booking,airplane,user)
  	@booking = booking
  	@airplane = airplane
  	@user = user
    mail(to: @user.email,:subject => "Your ticket is succesfully booked!")
  end
end
