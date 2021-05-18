json.extract! event, :id, :description, :lat, :long, :created_at, :updated_at
json.date event.date.strftime("%d/%m")
json.time event.time.strftime("%H:%M")
json.user event.user.name
json.url event_url(event, format: :json)
