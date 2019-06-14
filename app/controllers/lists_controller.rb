class ListsController < ApplicationController
  before_action :set_board
  def new
  end

  def create
    @list = List.create(list_params)
    respond_to do |format|
      format.html { redirect_to board_path(@board.id) }
      format.json
    end
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

  def list_params
    params.require(:list).permit(:name).merge(board_id: params[:board_id])
  end
end
