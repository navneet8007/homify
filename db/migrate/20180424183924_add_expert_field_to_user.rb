class AddExpertFieldToUser < ActiveRecord::Migration[5.1]
  def change
  	enable_extension "hstore"
    add_column :users, :expert_fields, :hstore

  end
end
