class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      # @commentの保存が成功した場合の処理
      redirect_to board_path(@board), notice: "コメントが作成されました"
    else
      puts @comment.errors.full_messages
      # @commentの保存が失敗した場合の処理
      redirect_to boards_path, alert: "コメントの作成に失敗しました"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end