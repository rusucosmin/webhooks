require 'test_helper'

class WebhooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webhook = webhooks(:one)
  end

  test "should get index" do
    get webhooks_url
    assert_response :success
  end

  test "should get new" do
    get new_webhook_url
    assert_response :success
  end

  test "should create webhook" do
    assert_difference('Webhook.count') do
      post webhooks_url, params: { webhook: { description: @webhook.description, disabled: @webhook.disabled, endpoint_url: @webhook.endpoint_url, event_types: @webhook.event_types, signing_secret: @webhook.signing_secret, user_id: @webhook.user_id } }
    end

    assert_redirected_to webhook_url(Webhook.last)
  end

  test "should show webhook" do
    get webhook_url(@webhook)
    assert_response :success
  end

  test "should get edit" do
    get edit_webhook_url(@webhook)
    assert_response :success
  end

  test "should update webhook" do
    patch webhook_url(@webhook), params: { webhook: { description: @webhook.description, disabled: @webhook.disabled, endpoint_url: @webhook.endpoint_url, event_types: @webhook.event_types, signing_secret: @webhook.signing_secret, user_id: @webhook.user_id } }
    assert_redirected_to webhook_url(@webhook)
  end

  test "should destroy webhook" do
    assert_difference('Webhook.count', -1) do
      delete webhook_url(@webhook)
    end

    assert_redirected_to webhooks_url
  end
end
