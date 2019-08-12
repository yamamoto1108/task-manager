class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :board_user, only: [:show, :edit, :update, :destroy]

  def index
    @pboards = Board.where(user_id: current_user.id, team_id: nil)
  end

  def show
    @list = List.new
  end

  def new
    @board = Board.new
    @backgrounds = Background.all
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path, notice: "ボードを作成しました。"
    else
      @backgrounds = Background.all
      render :new
    end
  end

  def edit
    @backgrounds = Background.all
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: "ボードを更新しました。"
    else
      @backgrounds = Background.all
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: "ボードを削除しました。"
  end

  private

  def board_params
    params.require(:board).permit(:name, :about, :deadline, :finish, :background_id, :team_id).merge(user_id: current_user.id)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def board_user
    @board = Board.find(params[:id])
    if @board.team.present?
      redirect_to boards_path unless @board.team.users.include?(current_user)
    else
      redirect_to boards_path unless @board.user == current_user
    end
  end
end
