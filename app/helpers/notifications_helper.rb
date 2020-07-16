module NotificationsHelper
	def notification_form(notification)
      @active = notification.active
      @comment = nil
      tweet = link_to 'あなたの投稿', users_tweet_path(notification),
      @visiter_comment = notification.comment_id
      #notification.actionがfollowかlikeかcommentか
      case notification.action
        when "follow" then
          tag.a(notification.active.name, href:users_user_path(@active) )+"があなたをフォローしました"
        when "like" then
          tag.a(notification.active.name, href:users_user_path(@active) )+"が"+tag.a('あなたの投稿', href:users_item_path(notification.item_id), style:"font-weight: bold;")+"にいいねしました"
        when "comment" then
            @comment = Comment.find_by(id: @active_comment)&.content
            tag.a(@active.name, href:users_user_path(@activ) )+"が"+tag.a('あなたの投稿', href:users_tweet_path(notification.tweet_id), style:"font-weight: bold;")+"にコメントしました"
      end
    end
end
