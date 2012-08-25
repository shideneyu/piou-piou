class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.order('created_at DESC').page(params[:page]).per(5)
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])
  end
  # POST /tweets
  # POST /tweets.json
  def create
    @tweets = Tweet.order('created_at DESC').page(params[:page])
    @tweet = Tweet.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url, notice: 'Tweet successfully created.' }
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        format.html { render action: "index" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'The tweet has been removed from the database.' }
      format.json { head :no_content }
    end
  end
end
