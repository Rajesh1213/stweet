class CreateUserTweets < ActiveRecord::Migration
  def change
    create_table :user_tweets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tweet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
