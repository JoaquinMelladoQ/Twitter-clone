class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes

    validates :content, presence: true

    def retweet
      @tweet = Tweet.find(params[:id]) if params[:id]
      rt = Tweet.new(params[:content])
      rt.user = current_user
  
        if rt.save
          @tweet.update(tweet_params)
          redirect_to root_path, notice: 'retweeted'
        else 
          redirect_to root_path, notice: 'something went wrong'
        end
    end

    def add_retweet
      tweet.update(total_retweets: tweet.total_retweets += 1)
    end

    def delete_retweet
      tweet.update(total_retweets: tweet.total_retweets -= 1)
    end
    
end

