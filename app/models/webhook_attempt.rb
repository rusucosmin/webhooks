class WebhookAttempt < ApplicationRecord
  belongs_to :webhook
  belongs_to :event
end
