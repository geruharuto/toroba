class FavoritesController < ApplicationController
  def create
	@tweet = Tweet.find(params[:tweet_id])
    @favorite = @tweet.favorites.new(user_id: current_user.id)
    @favorite.save
    #redirect_to request.referer
  @notification.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find(params[:book_id])
    @favorite = @tweet.favorites.find_by(user_id: current_user.id)
    @favorite.destroy
    redirect_to request.referer
  end

  def comment_create
  	@comment = Comment.find(params[:tweet_id])
	@favorite = @comment.favorites.new(user_id: current_user.id) 
    @favorite.save
    redirect_to request.referer
  end

  def comment_destroy
  	@comment = Comment.find(params[:tweet_id])
	@favorite = @comment.favorites.new(user_id: current_user.id) 
    @favorite.save
    redirect_to request.referer
  end
end
