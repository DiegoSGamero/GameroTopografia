class Devise::Mailer < Devise.parent_mailer.constantize
  include Devise::Controllers::UrlHelpers
  include Devise::Mailers::Helpers
  default template_path: 'users/mailer'

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end
end
