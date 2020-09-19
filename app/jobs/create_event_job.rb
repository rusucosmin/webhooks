class CreateEventJob < ApplicationJob
  queue_as :default

  # Events
  # id
  # type: todo_created
  # body: STRING (string-encoded JSON)
  # object_id: 123
  # object_type: Todo/User/Subscription FIX ME
  # created_at
  # updated_at
  #
  #
  # WebhookAttempts
  # * endpoint_url
  # * body
  # * response_code
  # * response_body
  # * webhook_id
  # * event_id

  def perform(type, body = {}, object_id)
    event = Event.create!(event_type: type, body: body.to_json, object_id: object_id)

    DispatchEventJob.perform_later(event)
  end
end
