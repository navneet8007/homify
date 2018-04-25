class CreateNovices < ActiveRecord::Migration[5.1]
  def change
    create_table :novices do |t|

      t.timestamps
    end
  end
end
