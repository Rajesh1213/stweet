class AddTweetsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tweets_count, :integer
  end
end
