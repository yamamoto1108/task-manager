class BoardsController < ApplicationController
  def index
  end

  def new
    @board = Board.new
    @backgrounds = Background.all
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
