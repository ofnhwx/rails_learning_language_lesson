# frozen_string_literal: true

class DeviseCreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :name, null: false
      t.text :profile
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :teachers, :email, unique: true
    add_index :teachers, :reset_password_token, unique: true
  end
end
