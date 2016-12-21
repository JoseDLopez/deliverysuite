class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :type
      t.string :status
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
