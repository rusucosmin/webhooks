class DeliverWebhookJob < ApplicationJob
  queue_as :default

  def hmac(body, secret)
    Base64.encode64(OpenSSL::HMAC.digest('sha256', secret, body))
  end

  def perform(event, webhook, wait_time: 2.seconds)
    webhook_attempt = WebhookAttempt.create!(
        event: event,
        webhook: webhook,
        endpoint_url: webhook.endpoint_url,
        body: event.body,
    )

    # call the endpoint
    #
    #

    response = HTTParty.post(webhook.endpoint_url, {
      body: event.body,
      headers: {
        'Content-Type': 'application/json',
        'x-signature-hmac-sha256': hmac(event.body, webhook.signing_secret),
      }
    })

    webhook_attempt.update!(response_body: response.body, response_code: response.code)

    unless response.code >= 200 && response.code < 300 # 2xx
      DeliverWebhookJob.set(wait: wait_time * 2).perform_later(event, webhook, wait_time: wait_time * 2)
    end
  end
end
