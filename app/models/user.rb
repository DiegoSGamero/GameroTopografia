class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties
  has_many_attached :photos, service: :cloudinary, dependent: :purge

  validates :full_name, presence: true, format: { with: /\A[a-zA-Z]+\.?(\s[a-zA-Z]+\.?)+\z/, message: "O nome completo deve ter pelo menos 2 nomes" }
  validates :email, presence: true, uniqueness: true
  validates :RG, presence: true, uniqueness: true, format: { with: /\A\d{7,9}\z/, message: "O RG deve ter entre 7 e 9 dígitos" }
  validates :CPF, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "O CPF deve ter exatamente 11 dígitos" }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "O número de telefone deve ter entre 10 e 11 dígitos" }
  validates :address, presence: true
  ROLES = %w[cliente Cliente Vizinho vizinho]
  validates :role, inclusion: { in: ROLES }

  attr_accessor :validate_password

  validates :password, format: { with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}\z/, message: 'Deve conter pelo menos uma letra e um número' }, if: :password_required?, on: :update

  attr_accessor :skip_password_validation

  private

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
