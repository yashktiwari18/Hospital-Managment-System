json.extract! room, :id, :room_number, :room_type, :capacity, :availability, :created_at, :updated_at
json.url room_url(room, format: :json)
