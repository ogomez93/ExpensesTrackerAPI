json.extract! expense, :id, :amount, :currency, :description, :title, :category_id, :user_id, :created_at, :updated_at
json.url api_v1_user_expense_url(@user[:slug], expense, format: :json)