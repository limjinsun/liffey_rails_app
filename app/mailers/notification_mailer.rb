class NotificationMailer < ApplicationMailer
  default from: 'liffeyireland-noreply@gmail.com'

  def notification_mail 
    @post = params[:post]
    mail(to: 'liffeydublin@naver.com', subject: 'Hey! New-posting')
  end

end
