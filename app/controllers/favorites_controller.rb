class FavoritesController < ApplicationController
  def create
  	tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.new(tweet_id: tweet.id)
    favorite.save
    tweet.create_notification_favorite!(current_user)
    redirect_to request.referer
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.find_by(tweet_id: tweet.id)
    favorite.destroy
    redirect_to request.referer
  end

end
