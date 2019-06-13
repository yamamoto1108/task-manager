class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
    @backgrounds = Background.all
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path
    else
      @backgrounds = Background.all
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def board_params
    params.require(:board).permit(:name, :about, :deadline, :finish, :background_id)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
