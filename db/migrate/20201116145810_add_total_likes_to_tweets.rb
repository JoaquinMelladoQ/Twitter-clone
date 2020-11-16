class AddTotalLikesToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :total_likes, :integer, default: 0
  end
end
