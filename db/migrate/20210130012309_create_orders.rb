class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, foreign_key: true
      t.string :caption, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
