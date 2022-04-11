class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save  #データが保存された時
      redirect_to prototype_path(@comment.prototype)  #詳細ページにリダイレクト
    else  #データが保存された時
      @prototype = @comment.ptototype  
      @comments = @prototype.comments
      render "prototypes/show"  #views/prototypes/show.html.erbのファイルを参照
    end
  end

  private #クラス外から呼び出すことができないメソッドを定義

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])  #ストロングパラメーターで特定のキーを受け取るように制限
  end
end
