class UsersController < ApplicationController
  require 'cloudinary'

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

  def update_photos
    current_user.photos.attach(params[:user][:photos])
    redirect_to user_profile_path, notice: 'Documentos enviados com sucesso!'
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :CPF, :address, :phone_number, :RG)
  end
end
