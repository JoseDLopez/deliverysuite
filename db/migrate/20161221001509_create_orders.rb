class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :total
      t.references :client, foreign_key: true
      t.references :zone, foreign_key: true

      t.timestamps
    end
  end
end
