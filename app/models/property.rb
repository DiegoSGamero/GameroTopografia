class Property < ApplicationRecord
  belongs_to :user

  validates :address, presence: true
  validates :owners, presence: { message: 'Precisamos de pelo menos um proprietário declarado' }
  validate :at_least_one_owner
  validates :size, presence: true
  validates :limit_type, presence: true
  validates :registration_number, presence: true, numericality: true

  private

  def at_least_one_owner
    errors.add(:base, 'Precisamos de pelo menos um proprietário declarado') if owners.blank?
  end
end
