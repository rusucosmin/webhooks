class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :body
      t.bigint :object_id

      t.timestamps
    end
  end
end
