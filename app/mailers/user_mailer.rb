class UserMailer < ApplicationMailer
  default from: 'kuz-kol@mail.ru'

  def welcome_email(mail)
    @user = 'kuz-kol@mail.ru'
    @url  = 'http://localhost:3000/'
    mail(to: @user, subject: 'Welcome to My Awesome Site')
  end

end
