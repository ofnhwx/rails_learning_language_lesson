class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.references :teacher, null: false, foreign_key: true, index: false
      t.datetime :started_at, null: false
      t.string :zoom_url, null: false
      t.references :language, null: false, foreign_key: true
      t.timestamps
    end

    add_index :lessons, %i[teacher_id started_at], unique: true
  end
end
