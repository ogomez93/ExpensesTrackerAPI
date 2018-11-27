json.extract! category, :id, :name, :user_id, :created_at, :updated_at
json.url api_v1_category_url(category, format: :json)
