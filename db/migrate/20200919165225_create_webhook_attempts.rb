class CreateWebhookAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :webhook_attempts do |t|
      t.references :webhook, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :endpoint_url
      t.string :body
      t.integer :response_code
      t.string :response_body

      t.timestamps
    end
  end
end
