class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :age
      t.string :sex
      t.string :secondary_email
      t.string :secondary_phone_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
