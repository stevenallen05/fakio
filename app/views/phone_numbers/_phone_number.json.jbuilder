json.extract! phone_number, :id, :pattern, :country, :legit, :created_at, :updated_at
json.url phone_number_url(phone_number, format: :json)
