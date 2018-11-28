class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :name, :last_name, :email, :phone_number, presence: true
  validates :email, :phone_number, uniqueness: { case_sensitive: false, message: "%{value} has already been taken" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "%{value} is not a valid email" }
  validates :phone_number, format: { with: /\A\d+\z/, message: "%{value} is not a valid phone number" }

  has_many :categories
  has_many :expenses
end
