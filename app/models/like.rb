class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
end

def add_like
  tweet.update(total_likes: tweet.total_like += 1)
end

def delete_like
  tweet.update(total_likes: tweet.total_like -= 1)
end
