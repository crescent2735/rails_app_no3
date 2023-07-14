class RequestsController < ApplicationController
  def new
    @game_recruitment = GameRecruitment.new
  end

  def create
    @board = Board.find(params[:board_id])
    @game_recruitment = GameRecruitment.find(params[:game_recruitment_id])
    @request = @game_recruitment.request.build(request_params)
    @request.user = current_user
    
    if @request.save
      # 保存が成功した場合の処理
      redirect_to board_game_recruitment_path(@board, @game_recruitment), notice: "リクエストが送信されました"
    else
      # 保存が失敗した場合の処理
      redirect_to board_game_recruitment_path(@board, @game_recruitment), alert: "リクエストの送信に失敗しました"
      puts @request.errors.full_messages
    end
  end

  def show
    @game_recruitment = GameRecruitment.find(params[:game_recruitment_id])
    @board = @game_recruitment.board
    @requests = @game_recruitment.request
  
    if current_user && @game_recruitment.user_id == current_user.id
      # ログイン中のユーザーが作成した募集のリクエストを表示
      @my_requests = @requests.select { |request| request.user_id == current_user.id }
    else
      @my_requests = []
      puts @request.errors.full_messages
    end
  end

  private

  def request_params
    params.require(:request).permit(:user_id, :content)
  end

end
