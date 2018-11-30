json.extract! category, :id, :name, :user_id, :created_at, :updated_at
json.url api_v1_user_category_url(@user[:slug], category, format: :json)
