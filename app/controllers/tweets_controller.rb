class TweetsController < ApplicationController
  before_action :set_tweet, only: [:new, :show, :edit, :update, :destroy, :create]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order("updated_at DESC").page params[:page]
  end

  def show
  end

  def new
    @tweet = Tweet.new
    @tweet_id = params[:tweet_id]
    @retweet = Tweet.find(params[:tweet_id])
  end
  
  def edit
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def retweet
    @tweet = Tweet.find(params.require(:id))
    @retweet = @tweet.retweets.new(user: current_user)
    @retweet.save
    new_rt = Tweet.new(content: @tweet.content, user: current_user)
    new_rt.content += ", retweeted by @#{@retweet.user.name}"
    new_rt.save

    redirect_to root_path
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:id]) if params[:id]
    end

    def tweet_params
      params.require(:tweet).permit(:content, :user_id, :tweet_id)
    end
end
