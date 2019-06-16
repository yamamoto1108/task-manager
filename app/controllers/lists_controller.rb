class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:edit, :update, :destroy]

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
    @list.update(list_params)
    @lists = List.all
  end

  def destroy
    @list.destroy
    redirect_to board_path(@board.id)
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:name).merge(board_id: params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end
end