class Category < ApplicationRecord
  validates :name, presence: true

  belongs_to :user

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
end
