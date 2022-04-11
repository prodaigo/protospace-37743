class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?  #deviseに関するコントローラーの処理であれば、メソッド呼び出し

  private
  def configure_permitted_parameters  #メソッド名は慣習
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])  # deviseのUserモデルにパラメーターを許可
  end
end
