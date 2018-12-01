class Category < ApplicationRecord
  validates :name, presence: true

  has_many :expenses
  belongs_to :user, optional: true

  enum defaults: [
    :groceries,
    :medicine,
    :meal,
    :electronic_device,
    :public_transport,
    :private_transport,
    :house_rent,
    :phone_rent
  ]

  def self.get_defaults
    Category.where(user_id: nil)
  end
end
