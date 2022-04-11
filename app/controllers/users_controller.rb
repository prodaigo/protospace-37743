class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  #特定のオブジェクトを取得し、インスタンス変数に代入
    @prototypes = @user.prototypes  #インスタンス変数を定義
  end
end
