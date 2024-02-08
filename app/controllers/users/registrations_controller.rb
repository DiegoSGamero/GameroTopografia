# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  around_action :disable_password_validation, only: [:edit, :update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name fantasy_name RG CPF CNPJ phone_number role address photos])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fantasy_name RG CPF CNPJ phone_number role address password password_confirmation current_password])
  end


  private

  def disable_password_validation
    resource_class.skip_callback(:validate, :before, :password_required, raise: false)
    yield
    resource_class.set_callback(:validate, :before, :password_required)
  end
end
