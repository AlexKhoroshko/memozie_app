json.extract! deck_card, :id, :front, :back, :status, :deck_id, :created_at, :updated_at
json.url deck_card_url(deck_card, format: :json)
