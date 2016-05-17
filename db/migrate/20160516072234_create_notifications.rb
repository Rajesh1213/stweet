class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notifiable_id
      t.string :notification_type
      t.boolean :is_read

      t.timestamps null: false
    end
  end
end
