# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments
    @user = User.find_by(id: @tweet.user_id)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      flash[:success] = '投稿しました'
      redirect_to(tweet_path(@tweet)) && return
    else
      flash[:danger] = '投稿に失敗しました'
      render(:new) && return
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      flash[:success] = '編集を保存しました'
      redirect_to tweet_path(@tweet)
    else
      flash[:success] = '編集を保存できませんでした'
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy!
    redirect_to user_path(current_user)
  end

  def followings_tweet
    @tweets = Tweet.where(user_id: current_user.followings)
  end

  def followers_tweet
    @tweets = Tweet.where(user_id: current_user.followers)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet, :listener, :genre, :user_id)
  end
end
