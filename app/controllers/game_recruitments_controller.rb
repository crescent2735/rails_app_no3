class GameRecruitmentsController < ApplicationController
  def new
    @game_recruitment = GameRecruitment.new
  end

  def create
    @board = Board.find(params[:board_id])
    @game_recruitment = @board.game_recruitments.build(game_recruitment_params)
    @game_recruitment.user = current_user

    if @game_recruitment.save
      # @game_recruitmentの保存が成功した場合の処理
      redirect_to board_path(@board), notice: "募集が作成されました"
    else
      # @game_recruitmentの保存が失敗した場合の処理
      redirect_to boards_path, alert: "募集の作成に失敗しました"
      puts @game_recruitment.errors.full_messages
    end
  end

  def show
    @board = Board.find(params[:board_id])
    @game_recruitment = GameRecruitment.find(params[:id])
    if @game_recruitment.channel_name.present?
      # チャンネル名を表示する処理
      @channel_name = @game_recruitment.channel_name
    else
      # チャンネル名が存在しない場合の処理
      @channel_name = "リクエスト申請が許可されたユーザーにのみ表示されます。"
    end
  end

  private
    def game_recruitment_params
      params.require(:game_recruitment).permit(:game_title, :description, :num_players, :channel_name)
    end

end
