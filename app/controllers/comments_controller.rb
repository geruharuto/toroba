class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
  	#comment = current_user.comments.new(comment_params)
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
  	comment.tweet_id = tweet.id #同じ変数を使い、足りない情報を追加している
  	if comment.save
  	 	 tweet.create_notification_comment(current_user, comment.id)
  	 	 redirect_to request.referer
  	else
      render "tweet/show"
  	end
  end

  def destroy
   	comment = Comment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
    comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
