json.extract! annoncement, :id, :title, :description, :type, :price, :location, :user_id, :category_id, :created_at, :updated_at
json.url annoncement_url(annoncement, format: :json)
