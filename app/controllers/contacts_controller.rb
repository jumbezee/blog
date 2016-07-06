require "net/smtp"



class ContactsController < ApplicationController



  def new
  end

  def create
    smtp = Net::SMTP.new 'smtp.gmail.com',587
    smtp.enable_starttls

    @contact = Contact.new(contact_params)
    if @contact.valid?
          smtp.start('smtp.gmail.com','kuzmenkon994@gmail.com','mikluxa1994',:login)

          msg2send = "Welcome to example.com, #{@contact.email} 
===============================================

You have successfully signed up to example.com,
your username is: #{current_user.username} .

Your message is : #{@contact.message}. 

Thanks for joining and have a great day!"

          smtp.send_message msg2send,'kuzmenkon994@gmail.com',"#{@contact.email}"
          smtp.finish    
          @contact.save
    else
      render action: 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end
