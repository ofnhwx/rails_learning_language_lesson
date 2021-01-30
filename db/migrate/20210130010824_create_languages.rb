class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :label, null: false
      t.timestamps
    end

    add_index :languages, :label, unique: true
  end
end
