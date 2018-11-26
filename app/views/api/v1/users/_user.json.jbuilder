json.extract! user, :id, :name, :last_name, :email, :phone_number, :created_at, :updated_at
json.url api_v1_user_url(user, format: :json)
