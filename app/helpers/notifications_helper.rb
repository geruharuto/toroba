module NotificationsHelper
	def notification_form(notification)
      @active = User.find(notification.active_id)
      @comment = nil
      @passive_comment = notification.comment_id

      case notification.action.to_sym
        when :follow then
          tag.a(@active.name, href: user_path(@active) )+"があなたをフォローしました"
        when :favorite then
          tag.a(@active.name, href: user_path(@active) )+"が"+tag.a('あなたの投稿', href: tweet_path(notification.tweet_id), style:"font-weight: bold;")+"にいいねしました"
        when :comment then
          @comment = Comment.find_by(id: @active_comment)&.content
          tag.a(@active.name, href:user_path(@active) )+"が"+tag.a('あなたの投稿', href: tweet_path(notification.tweet_id), style:"font-weight: bold;")+"にコメントしました"
        when :directmessage then
          tag.a(@active.name, href: user_path(@active) )+"が"+tag.a('あなたにDM', href: room_path(notification.room_id), style:"font-weight: bold;")+"を送りました"
      end
  end
end