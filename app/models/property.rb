class Property < ApplicationRecord
  belongs_to :user

  validates :address, presence: true
  validates :owners, presence: { message: 'Precisamos de pelo menos um proprietário declarado' }
  validates :size, presence: { message: 'Coloque um valor aproximado por favor ( Ex: 45m quadrados/22 halqueires)' }
  validates :limit_type, presence: { message: 'Necessário pelo menos um tipo de divisa (Ex: Cerca, Muro...)' }
  validates :registration_number, uniqueness: true
end
