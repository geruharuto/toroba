# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :hoge
  before_action :configure_permitted_parameters, if: :devise_controller?
  # デバイス機能実行前にconfigure_permitted_parametersの実行をする。

  def hoge
    raise
  end

  def after_sign_in_path_for(_resource) # ログイン後に遷移
    tweets_path
  end

  def after_sign_out_path_for(_resource) # ログアウト後に遷移
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name email))
    # sign_upの際にnameのデータ操作を許可。追加したカラム。
  end
end
