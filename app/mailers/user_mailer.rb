class UserMailer < ApplicationMailer
  default from: 'contato.gamero.topografia@gmail.com'

  def contact_email(contact_params)
    @name = contact_params[:name]
    @phone_number = contact_params[:phone_number]
    @subject = contact_params[:subject]
    @message = contact_params[:message]

    mail(to: 'contato.gamero.topografia@gmail.com', subject: @subject)
  end
end
