class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :lesson, null: false, foreign_key: true, index: false
      t.references :ticket, null: false, foreign_key: true, index: false
      t.timestamps
    end

    add_index :reservations, :lesson_id, unique: true
    add_index :reservations, :ticket_id, unique: true
  end
end
