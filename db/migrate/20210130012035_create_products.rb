class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :label, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.timestamps
    end

    add_index :products, :label, unique: true
  end
end
