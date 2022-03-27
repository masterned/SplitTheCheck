json.extract! restaurant, :id, :name, :location, :will_split_votes, :will_not_split_votes, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
