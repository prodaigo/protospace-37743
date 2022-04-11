class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]  #ログインしていない状態の特定のページへのアクセスを制限
  before_action :move_to_index, only: :edit

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)  #インスタンス変数の作成
    if @prototype.save  #データが保存された時
      redirect_to root_path  #ルートパスにリダイレクト
    else  #データが保存されなかった時
      render :new  #新規投稿ページに戻す
    end
  end

  def show
    @prototype = Prototype.find(params[:id])  #特定のオブジェクトを取得し、インスタンス変数に代入
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])  #特定のオブジェクトを取得し、インスタンス変数に代入
  end

  def update
    @prototype = Prototype.find(params[:id])  #特定のオブジェクトを取得し、インスタンス変数に代入
    if @prototype.update(prototype_params)  #データがが更新された時
      redirect_to action: :show  #詳細ページにリダイレクト
    else  #データがが更新されたなかった時
      render :edit  #データを残したまま、編集ページへ戻す
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])  #特定のオブジェクトを取得し、インスタンス変数に代入
    prototype.destroy  #データを削除
    redirect_to root_path  #ホームにリダイレクト
  end

  private  #クラス外から呼び出すことができないメソッドを定義

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)  #ストロングパラメーターで特定のキーを受け取るように制限
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])  #特定のオブジェクトを取得し、インスタンス変数に代入
    unless user_signed_in? && current_user.id == @prototype.user_id  #「ユーザーがログインしている」かつ「投稿したユーザーである投稿だけに許可」で条件分岐
      redirect_to action: :index  #トップページにリダイレクト
    end
  end
end
