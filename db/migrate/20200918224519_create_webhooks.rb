class CreateWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_table :webhooks do |t|
      t.string :endpoint_url
      t.string :description
      t.string :event_types
      t.references :user, null: false, foreign_key: true
      t.boolean :disabled
      t.string :signing_secret

      t.timestamps
    end
  end
end
