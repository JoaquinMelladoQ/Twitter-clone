class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, optional: true
  has_many :likes

    validates :content, presence: true


    def add_retweet
      tweet.update(total_retweets: tweet.total_retweets += 1)
    end

    def delete_retweet
      tweet.update(total_retweets: tweet.total_retweets -= 1)
    end
    
end

