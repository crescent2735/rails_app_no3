class BoardsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = "掲示板の作成が完了しました!"
      redirect_to root_path
    else
      render 'board/index', status: :unprocessable_entity
    end
  end

  def show
    @board = Board.find(params[:id])
    # ボードに関連するスレッド（ゲーム募集とコメント）を取得し、作成日時で並び替え
    @threads = (GameRecruitment.where(board_id: @board.id) + Comment.where(board_id: @board.id)).sort_by(&:created_at).reverse
  end

  def destroy; end

  private
  def board_params
    params.require(:board).permit(:title)
  end
end
