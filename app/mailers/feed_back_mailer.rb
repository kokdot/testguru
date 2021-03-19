class FeedBackMailer < ApplicationMailer

  def feed_back_send(message)
    @message = message

    mail to: Admin.first.email, subject: 'Сообщение от пользователя.'
  end
end
