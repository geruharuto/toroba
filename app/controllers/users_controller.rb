class UsersController < ApplicationController
  before_action :authenticate_user! #ログイン済ユーザーのみ許可
  def show
    @user = User.find(params[:id])
    @mytweet = @user.tweets
    #dmルーム作成
    @current_user_entry = Entry.where(user_id: current_user.id)
    @opponent_user_entry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @current_user_entry.each do |cu|
        @opponent_user_entry.each do |ou|
          if cu.room_id == ou.room_id then
            @isroom = true
            @roomid = cu.room_id
          end
        end
      end
      if @isroom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "編集を保存しました"
      redirect_to user_path(@user)
    else
      flash[:success] = "編集を保存できませんでした"
      render :edit
    end
  end

  def withdrawal
    @user = current_user
  end

  def destroy
    user = current_user
    user.destroy
    flash[:success] = "ありがとうございました"
    redirect_to root_path
  end

  def about ;
  end

  def follows
    @users = current_user.followings
  end

  def followers
    @user = current_user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end