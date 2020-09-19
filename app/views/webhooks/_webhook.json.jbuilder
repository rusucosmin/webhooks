json.extract! webhook, :id, :endpoint_url, :description, :event_types, :user_id, :disabled, :signing_secret, :created_at, :updated_at
json.url webhook_url(webhook, format: :json)
