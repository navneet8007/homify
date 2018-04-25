class AddCustomFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :user_type, :string
    add_column :users, :status, :string
  end
end
