class CardsController < ApplicationController
  before_action :set_board

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    redirect_to board_path(@board)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def card_params
    params.require(:card).permit(:name, :about, :deadline, :finish, :list_id)
  end
end
