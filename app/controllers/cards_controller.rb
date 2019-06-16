class CardsController < ApplicationController
  before_action :set_board
  
  def show
  end

  def new
  end

  def create
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
end
