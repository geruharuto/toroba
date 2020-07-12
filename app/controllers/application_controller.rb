class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #デバイス機能実行前にconfigure_permitted_parametersの実行をする。

  def after_sign_in_path_for(resource) # ログイン後に遷移
    tweets_path
  end

  def after_sign_out_path_for(resource) # ログアウト後に遷移
    home_about_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    #sign_upの際にnameのデータ操作を許可。追加したカラム。
  end
end
