class ContactController < ApplicationController
  def new; end

  def create
    UserMailer.contact_email(params).deliver_now
    redirect_to root_path, notice: 'E-mail enviado com sucesso!'
  end
end
