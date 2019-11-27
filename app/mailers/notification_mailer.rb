class NotificationMailer < ApplicationMailer
  default from: 'liffeyireland-noreply@gmail.com'

  def notification_mail 
    @mail_content = params[:mail_content]
    mail(to: 'liffeydublin@naver.com', subject: 'Hey! New-posting')
  end

end
