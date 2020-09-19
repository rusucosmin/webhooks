class AddMoreDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :school_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :stripe_customer_id, :string
  end
end
