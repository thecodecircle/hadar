json.extract! event, :id, :time, :date, :description, :created_at, :updated_at
json.user event.user.name
json.url event_url(event, format: :json)
