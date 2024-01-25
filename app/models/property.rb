class Property < ApplicationRecord
  belongs_to :user

  validates :address, presence: true
  validates :owners, presence: { message: 'Precisamos de pelo menos um proprietário declarado' }
  validates :size, presence: true
  validates :limit_type, presence: true
  validates :registration_number, presence: true, numericality: true, uniqueness: true
end
