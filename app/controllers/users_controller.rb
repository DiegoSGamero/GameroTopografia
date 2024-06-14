class UsersController < ApplicationController
  require 'cloudinary'
  before_action :authenticate_user!, except: %i[index show]

  def index
    @query = params[:search]&.dig(:query)
    if @query.present?
      search_query = "%#{@query}%"
      @users = User.where('full_name ILIKE :query', query: search_query)
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end

  def sign_out
    sign_out current_user
    redirect_to root_path
  end

  def profile
    @user = current_user
  end

  def show_photos
    @user = User.find(params[:id])
    @photos = @user.photos
  end

  def delete_photo
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:photo_id])

    # Remover a foto do Cloudinary
    Cloudinary::Uploader.destroy(@photo)

    # Remover a foto do banco de dados
    @photo.destroy

    redirect_to user_profile_path, notice: "Foto excluída com sucesso."
  end


  def edit
  end

  def update
  end

  def destroy
  end

  # def update_photos
  #   @user = current_user
  #   @user.skip_password_validation = true
  #   @user.photos.attach(params[:user][:photos])
  #   redirect_to user_profile_path, notice: 'Documentos enviados com sucesso!'
  # end

  def update_photos
    @user = current_user
    photos = params[:user][:photos]
    @user.photos.attach(photos) if photos.present?
    redirect_to user_profile_path, notice: 'Documentos enviados com sucesso!'
  end

  # def send_reset_password_instructions
  #   user = User.find_by(email: params[:email])
  #   if user.present?
  #     user.send_reset_password_instructions
  #     flash[:notice] = "Instruções de reset de senha foram enviadas para o seu e-mail."
  #   else
  #     flash[:alert] = "E-mail não encontrado."
  #   end
  #   redirect_to new_user_session_path
  # end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :CPF, :address, :phone_number, :RG, :photo)
  end

  # def password_required?
  #   new_record? || password.present? || password_confirmation.present?
  # end
end
