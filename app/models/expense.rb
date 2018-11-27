class Expense < ApplicationRecord
  validates :amount, :currency, :title, :user_id, presence: true

  belongs_to :category
  belongs_to :user
end
