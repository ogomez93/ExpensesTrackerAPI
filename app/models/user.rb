class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :name, :last_name, :email, :phone_number, presence: true
  validates :email, :phone_number, :username, uniqueness: { case_sensitive: false, message: "%{value} has already been taken" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "%{value} is not a valid email" }
  validates :phone_number, format: { with: /\A\d+\z/, message: "%{value} is not a valid phone number" }
  validates :username, format: { with: /\A[a-zA-Z0-9]*\z/, message: "%{value} is not a valid username" }

  has_many :categories
  has_many :expenses

  def should_generate_new_friendly_id?
    slug.blank? || username_changed?
  end
end
