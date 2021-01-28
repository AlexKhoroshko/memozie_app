json.extract! deck, :id, :title, :description, :user_id, :created_at, :updated_at
json.url deck_url(deck, format: :json)
