class UsersController < ApplicationController
  before_action :authenticate_user! #ログイン済ユーザーのみ許可
  def show
    @user = User.find(params[:id])
    @mytweet = @user.tweets
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
    client.destroy
    flash[:success] = "編集を保存しました"
    redirect_to home_about_path
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
