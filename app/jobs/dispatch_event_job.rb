class DispatchEventJob < ApplicationJob
  queue_as :default

  def perform(event)
    # finds all the webhooks interested in this event

    # event.object_id -> Todo

    todo = Todo.find(event.object_id)
    user = todo.user

    event_type = event.event_type

    Webhook.where(user: user, disabled: false).where("event_types like '%#{event_type}%'").find_each do |webhook|
      DeliverWebhookJob.perform_later(event, webhook)
    end
  end
end
