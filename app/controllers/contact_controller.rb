class ContactController < ApplicationController
  def new; end

  def create
    contact_params = params.permit(:name, :phone_number, :subject, :message)
    UserMailer.contact_email(contact_params).deliver_now
    redirect_to root_path, notice: 'E-mail enviado com sucesso!'
  end
end
